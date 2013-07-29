class FavoritesController < ApplicationController
  before_filter :find_favorite, only: [:show,
                                       :edit,
                                       :update,
                                       :destroy]

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.save
      flash[:notice] = "Favorite has been created."
      redirect_to @favorite
    else
      flash[:alert] = "Favorite has not been created."
      render action: "new"
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])
    if @favorite.update_attributes(params[:favorite])
      flash[:notice] = "Favorite has been updated."
      redirect_to @favorite
    else
      flash[:alert] = "Favorite has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash[:notice] = "Favorite has been deleted."
    redirect_to favorites_path
  end

private
  def find_favorite
    @favorite = Favorite.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The favorite you were looking for could not be found."
    redirect_to favorites_path
  end
end


