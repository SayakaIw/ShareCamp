class Public::SearchesController < ApplicationController

  before_action :authenticate_end_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = Site.search_for(@content, @method)
  end

  def index
    @tags = Tag.all
  end

  def fieldsearch
    @tags = Tag.all
    @prefecture = params[:prefecture_id]
    @field_type = params[:field_type_id]
    @results = Site.search(@prefecture,@field_type)
  end

end
