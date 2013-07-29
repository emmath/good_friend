require 'spec_helper'

feature "Deleting friends" do
  scenario "Deleting a friend" do
    Factory(:friend, name: "Marlena")
    visit '/friends'
    click_link "Marlena"
    click_link "Delete Friend"
    page.should have_content("Friend has been deleted.")

    visit '/friends'
    page.should_not have_content("Marlena")
  end
end
