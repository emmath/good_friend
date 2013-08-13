require 'spec_helper'

feature 'Creating Birthdays' do
  before do
    @friend = FactoryGirl.create(:friend, name: "Alana", description: "oldest friend")
    @favorite = FactoryGirl.create(:favorite, thing: "Candy")
    visit '/'
    page.should have_content(@friend.name)
  end

  scenario "can create a valid birthday" do
    page.select(@friend.name, from: "birthday_friend")
    page.select(@favorite.thing, from: "birthday_favorite")
    click_button 'Create Birthday'
    page.should have_content("Friend has been created.")

    birthday = Birthday.find_by_nickname("Aubergine")
    page.current_url.should == birthday_url(birthday)
    title = "Aubergine - Birthdays - Good Friend"
    find("title").should have_content(title)
  end
end
