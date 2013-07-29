class BirthdaysController < ApplicationController
  before_filter :find_friends_and_favorites, only: [:show,
                                                   :edit,
                                                   :update,
                                                   :destroy]

  def index
    @birthdays = Birthday.all
  end

  def new
    @birthday = Birthday.new
  end

  def create
    @birthday = Birthday.new(params[:birthday])
    if @birthday.save
      flash[:notice] = "Birthday has been created."
      redirect_to @birthday
    else
      flash[:alert] = "Birthday has not been created."
      render action: "new"
    end
  end

  def show
    @birthday = Birthday.find(params[:id])
  end

  def edit
    @birthday = Birthday.find(params[:id])
  end

  def update
    @birthday = Birthday.find(params[:id])
    if @birthday.update_attributes(params[:birthday])
      flash[:notice] = "Birthday has been updated."
      redirect_to @birthday
    else
      flash[:alert] = "Birthday has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @birthday = Birthday.find(params[:id])
    @birthday.destroy
    flash[:notice] = "Birthday has been deleted."
    redirect_to birthdays_path
  end

private
  def find_friends_and_favorites
    @friend = Friend.all
    @favorite = Favorite.all
  end
end




