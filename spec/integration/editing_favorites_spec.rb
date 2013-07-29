require 'spec_helper'

feature "Editing favorites" do
  before do
    Factory(:favorite, thing: "Cake")
    visit '/favorites'
    click_link "Cake"
    click_link "Edit Favorite"
  end

  scenario "Updating a favorite" do
    fill_in "Thing", with: "Pie"
    click_button "Update Favorite"
    page.should have_content("Favorite has been updated.")
  end

  scenario "Updating a favorite with invalid attributes is wrong" do
    fill_in "Thing", with: ""
    click_button "Update Favorite"
    page.should have_content("Favorite has not been updated.")
  end
end
