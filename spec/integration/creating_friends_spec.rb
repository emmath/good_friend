require 'spec_helper'

feature 'Creating Friends' do
  scenario "can create a friend" do
    visit '/'
    click_link 'New Friend'
    fill_in 'Name', with: 'Marlena'
    fill_in 'Description', with: 'Best Friend'
    click_button 'Create Friend'
    page.should have_content("Friend has been created.")

    friend = Friend.find_by_name("Marlena")
    page.current_url.should == friend_url(friend)
    title = "Marlena - Friends - Good Friend"
    find("title").should have_content(title)
  end
end
