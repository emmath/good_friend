require 'spec_helper'

feature "Viewing favorites" do
  scenario "Listing all favorites" do
    favorite = Factory.create(:favorite, thing: "Cake")
    visit '/favorites'
    click_link 'Cake'
    page.current_url.should == favorite_url(favorite)
  end
end
