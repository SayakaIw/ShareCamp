class Public::FavoritesController < ApplicationController
  def create
    @site = Site.find(params[:site_id])
    favorite = current_end_user.favorites.new(site_id: @site.id)
    favorite.save
    #redirect_to site_path(site)
  end

  def destroy
    @site = Site.find(params[:site_id])
    favorite = current_end_user.favorites.find_by(site_id: @site.id)
    favorite.destroy
    #redirect_to site_path(site)
  end
end
