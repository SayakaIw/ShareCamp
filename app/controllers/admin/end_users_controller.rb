class Admin::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.all.page(params[:page]).per(15)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @site = @end_user.sites
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_users_path
    else
      render "edit"
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :kana_name, :nick_name, :email, :is_deleted)
  end

end
