class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'site'
      @records = Site.search_for(@content, @method)
    else
      @records = EndUser.search_for(@content, @method)
    end
  end

  def index
  end

end

