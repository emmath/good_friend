require 'spec_helper'

feature 'Creating Friends' do
  before do
    visit '/'
    click_link 'New Friend'
  end

  scenario "can create a friend" do
    fill_in 'Name', with: 'Marlena'
    fill_in 'Description', with: 'Best Friend'
    click_button 'Create Friend'
    page.should have_content("Friend has been created.")

    friend = Friend.find_by_name("Marlena")
    page.current_url.should == friend_url(friend)
    title = "Marlena - Friends - Good Friend"
    find("title").should have_content(title)
  end

  scenario "can not create a friend without a name" do
    click_button 'Create Friend'
    page.should have_content("Friend has not been created.")
    page.should have_content("Name can't be blank")
  end
end
