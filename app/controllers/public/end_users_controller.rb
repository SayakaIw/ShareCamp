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
  
  private
  
  def end_user_params
    params.require(:end_user).permit(:name, :kana_name, :nick_name, :email)
  end
  
end
