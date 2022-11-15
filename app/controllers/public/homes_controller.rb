class Public::HomesController < ApplicationController

  def top
    @sites = Site.order(created_at: :desc).limit(3)
  end

  def about
  end

end
