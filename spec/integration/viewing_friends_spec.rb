require 'spec_helper'

feature "Viewing friends" do
  scenario "Listing all friends" do
    friend = Factory.create(:friend, name: "Marlena")
    visit '/friends'
    click_link 'Marlena'
    page.current_url.should == friend_url(friend)
  end
end
