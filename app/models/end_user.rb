class EndUser < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sites, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :site_comments, dependent: :destroy
  # has_many :favorited_sites, throught: :favorites, source: :site

  enum is_deleted: { "in_use": false, "withdrawal": true }


  def self.guest #null:falseの情報は全て追記する
    find_or_create_by!(email: 'guest@example.com') do |end_user| #guestアドレスがあれば探し、なければ作る
      end_user.password = SecureRandom.urlsafe_base64 #ランダムな文字列生成
      end_user.name = "ゲスト"
      end_user.kana_name = "ゲスト"
      end_user.nick_name = "ゲスト"
      end_user.is_deleted = false
    end
  end

  # def self.search_for(content, method)
  #   if method == 'perfect'
  #     EndUser.where(nick_name: content)
  #   elsif method == 'forward'
  #     EndUser.where('nick_name LIKE?', content + '%')
  #   elsif method == 'backward'
  #     EndUser.where('nick_name LIKE?', '%' + content)
  #   else
  #     EndUser.where('nick_name LIKE?', '%' + content + '%')
  #   end
  # end

end
