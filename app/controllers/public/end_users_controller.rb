class Public::EndUsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw #利用者、理論退会処理（ステータス更新）
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end
end
