class Admin::SiteCommentsController < ApplicationController
  
  def destroy
    @site = Site.find(params[:site_id])
    SiteComment.find(params[:id]).destroy
    redirect_to request.referer
  end
end
