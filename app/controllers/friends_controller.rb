class FriendsController < ApplicationController

  def index
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(params[:friend])
    if @friend.save
      flash[:notice] = "Friend has been created."
      redirect_to @friend
    else
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end
end
