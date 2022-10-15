class Public::HomesController < ApplicationController

  def top
    @sites = Site.order(created_at: :desc).limit(3)
    # @items = Item.page(params[:page]).per(4).order(created_at: :desc)
  end

  def about
  end

end
