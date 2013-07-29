require 'spec_helper'

describe FavoritesController do
  it "displays an error for a missing favorite" do
    get :show, :id => "not-here"
    response.should redirect_to(favorites_path)
    message = "The favorite you were looking for could not be found."
    flash[:alert].should == message
  end
end
