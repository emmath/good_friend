require 'spec_helper'

feature "Deleting favorites" do
  scenario "Deleting a favorite" do
    Factory(:favorite, thing: "Cake")
    visit '/favorites'
    click_link "Cake"
    click_link "Delete Favorite"
    page.should have_content("Favorite has been deleted.")

    visit '/favorites'
    page.should_not have_content("Cake")
  end
end
