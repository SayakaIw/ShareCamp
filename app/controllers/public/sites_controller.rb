class Public::SitesController < ApplicationController
  def show
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.end_user_id = current_end_user.id
    @site.save
    redirect_to my_page_path
  end

  def index
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to my_page_path, notice: "You have updated site-date successfully"
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def site_params
    params.require(:site).permit(:name, :review, :local_specialty, :url, :image, :prefectures, :site_type, :field_type, :daycamp)
  end

end
