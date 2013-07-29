require 'spec_helper'

feature 'Creating Favorites' do
  before do
    visit '/favorites'
    click_link 'New Favorite'
  end

  scenario "can create a favorite" do
    fill_in 'Thing', with: 'Cake'
    click_button 'Create Favorite'
    page.should have_content("Favorite has been created.")

    favorite = Favorite.find_by_thing("Cake")
    page.current_url.should == favorite_url(favorite)
    title = "Cake - Favorites - Good Friend"
    find("title").should have_content(title)
  end

  scenario "can not create a favorite without a thing" do
    click_button 'Create Favorite'
    page.should have_content("Favorite has not been created.")
    page.should have_content("Thing can't be blank")
  end
end
