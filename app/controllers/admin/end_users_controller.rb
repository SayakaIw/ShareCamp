class Admin::EndUsersController < ApplicationController
  
  def index
    @end_users = EndUser.all.page(params[:page]).per(15)
  end

  def show
  end

  def edit
  end

  def update
  end
end
