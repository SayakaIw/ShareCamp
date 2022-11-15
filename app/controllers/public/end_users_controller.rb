class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  # before_action :ensure_guest, only: [:edit]

  def show
    @end_user = current_end_user
    favorites= Favorite.where(end_user_id: @end_user.id).pluck(:site_id)
    @favorite_sites = Site.find(favorites)
    @site = @end_user.sites
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      flash[:success] = "変更内容を登録しました"
      redirect_to my_page_path
    else
      flash.now[:danger] = "変更に失敗しました"
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw #利用者、理論退会処理（ステータス更新）
    @end_user = current_end_user
    @end_user.update(is_deleted: true)

    reset_session
    flash[:success] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :kana_name, :nick_name, :email)
  end

end
