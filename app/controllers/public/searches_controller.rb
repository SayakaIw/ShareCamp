class Public::SearchesController < ApplicationController

  before_action :authenticate_end_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'site'
      @records = Site.search_for(@content, @method)
    else
      render 'index'
    end
  end

  def index
  end

  def fieldsearch
    @sites = Site.search(params[:keyword])
  end

end
