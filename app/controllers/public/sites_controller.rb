class Public::SitesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :correct_end_user, only: [:edit, :update]

  def show
    @site = Site.find(params[:id])
    @site_comment = SiteComment.new
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.end_user_id = current_end_user.id
    if @site.save
      # タグの保存
      @site.save_tags(params[:site][:tag])
      flash[:success] = "登録しました"
      redirect_to my_page_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def index
    @sites = Site.all.page(params[:page]).per(10)
    @all_ranks = Site.create_all_ranks
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      # タグの更新
      @site.save_tags(params[:site][:tag])
      flash[:success] = "編集に成功しました"
      redirect_to my_page_path
    else
      flash.now[:danger] = "編集に失敗しました"
      render "edit"
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit(:name, :review, :local_specialty, :url, :image, :prefecture, :site_type, :field_type, :daycamp, :evaluation)
  end

  def correct_end_user
    @site = Site.find(params[:id])
    @end_user = @site.end_user
    redirect_to(sites_path) unless @end_user == current_end_user
  end

end
