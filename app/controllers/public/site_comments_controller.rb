class Public::SiteCommentsController < ApplicationController
  def create
    @site = Site.find(params[:site_id])
    comment = current_end_user.site_comments.new(site_comment_params)
    comment.site_id = @site.id
    comment.save
  end

  def destroy
    SiteComment.find(params[:id]).destroy
    @site = Site.find(params[:site_id])
  end

  private

  def site_comment_params
    params.require(:site_comment).permit(:comment)
  end
end
