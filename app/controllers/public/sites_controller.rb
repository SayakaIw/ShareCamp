class Public::SitesController < ApplicationController
  before_action :authenticate_end_user!
  def show
    @site = Site.find(params[:id])
    @site_comment = SiteComment.new
    # @site_comments = @site.site_comment
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
    @sites = Site.all.page(params[:page]).per(10)
    @all_ranks = Site.create_all_ranks
    # @fieldsites = Site.search(params[:keyword])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to my_page_path, notice: "You have updated site-information successfully"
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
