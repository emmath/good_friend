require 'spec_helper'

describe FriendsController do
  it "displays an error for a missing friend" do
    get :show, :id => "not-here"
    response.should redirect_to(friends_path)
    message = "The friend you were looking for could not be found."
    flash[:alert].should == message
  end
end
