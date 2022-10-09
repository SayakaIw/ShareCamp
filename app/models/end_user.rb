class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest #null:falseの情報は全て追記する
    find_or_create_by!(email: 'guest@example.com') do |end_user| #guestアドレスがあれば探し、なければ作る
      end_user.password = SecureRandom.urlsafe_base64 #ランダムな文字列生成
      end_user.name = "ゲスト"
      end_user.kana_name = "ゲスト"
      end_user.nick_name = "ゲスト"
      end_user.is_deleted = false
    end
  end

end
