require 'spec_helper'

feature "Editing friends" do
  before do
    Factory(:friend, name: "Marlena")
    visit '/friends'
    click_link "Marlena"
    click_link "Edit Friend"
  end

  scenario "Updating a friend" do
    fill_in "Name", with: "Marlena Zatloukal"
    click_button "Update Friend"
    page.should have_content("Friend has been updated.")
  end

  scenario "Updating a friend with invalid attributes is wrong" do
    fill_in "Name", with: ""
    click_button "Update Friend"
    page.should have_content("Friend has not been updated.")
  end
end
