class Admin::SitesController < ApplicationController
  def index
    @sites = Site.all.page(params[:page]).per(10)
    @all_ranks = Site.create_all_ranks
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
