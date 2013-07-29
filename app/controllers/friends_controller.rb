class FriendsController < ApplicationController
before_filter :find_friend, :only => [:show,
                                       :edit,
                                       :update,
                                       :destroy]

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

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    flash[:notice] = "Friend has been deleted."
    redirect_to friends_path
  end

private
  def find_friend
    @friend = Friend.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The friend you were looking for could not be found."
    redirect_to friends_path
  end
end
