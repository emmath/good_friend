class FriendsController < ApplicationController

  def index
    @friends = Friend.all
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
      flash[:alert] = "Friend has not been created."
      render action: "new"
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update_attributes(params[:friend])
      flash[:notice] = "Friend has been updated."
      redirect_to @friend
    else
      flash[:alert] = "Friend has not been updated."
      render action: "edit"
    end
  end
end
