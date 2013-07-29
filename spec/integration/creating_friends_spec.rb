require 'spec_helper'

feature 'Creating Friends' do
  scenario "can create a friend" do
    visit '/'
    click_link 'New Friend'
    fill_in 'Name', with: 'Marlena'
    fill_in 'Description', with: 'Best Friend'
    click_button 'Create Friend'
    page.should have_content("Friend has been created.")
  end
end
