class Site < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
  has_many :favorites, dependent: :destroy
  has_many :site_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :name,presence:true
  validates :review,presence:true,length:{maximum:200}


  enum prefecture:{ hokkaido:0,
    aomori:1,iwate:2,miyagi:3,akita:4,yamagata:5,fukushima:6,ibaraki:7,
    tochigi:8,gunma:9,saitama:10,chiba:11,tokyo:12,kanagawa:13,niigata:14,
    toyama:15,ishikawa:16,fukui:17,yamanashi:18,nagano:19,gifu:20,
    sizuoka:21,aichi:22,mie:23,shiga:24,
    kyoto:25,osaka:26,hyogo:27,nara:28,wakayama:29,tottori:30,
    shimane:31,okayama:32,hiroshima:33,yamaguchi:34,tokushima:35,
    kagawa:36,ehime:37,kouchi:38,fukuoka:39,
    saga:40,nagasaki:41,kumamoto:42,oita:43,miyazaki:44,kagoshima:45,okinawa:46
  }

  enum site_type:{ section:0,free:1,cottage:2,glamping:3 }
  validates :site_type, inclusion: {in: Site.site_types.keys }
  enum field_type:{ forest:0,grass:1,riverside:2,seaside:3,lakeside:4 }
  enum daycamp:{ have:0,nothing:1,notclear:2 }

  #投稿時、画像が無かった場合はnoimgを表示する
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/camp-noimg.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  #週間いいねランキング
  def self.create_all_ranks
    #Site.find(Favorite.group(:site_id).where(created_at: Time.current.all_week).order('count(site_id) desc').limit(5).pluck(:site_id))
    ranking = Favorite.group(:site_id).order('count(site_id) desc').limit(5).count
    self.where(id: ranking.keys).sort_by{|o| ranking[o.id] }.reverse
  end

  #検索方法分岐(サイト名)
  def self.search_for(content, method)
    if method == 'perfect'
      Site.where(name: content)
    elsif method == 'forward'
      Site.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Site.where('name LIKE?','%' + content)
    else
      Site.where('name LIKE?', '%' + content + '%')
    end
  end

  #カテゴリー検索
  def self.search(prefecture_id,filed_type_id)
    Site.where(prefecture: prefecture_id).where(field_type: filed_type_id)
  end

  #タグ検索
  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags
    p current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      new_site_tag = Tag.find_or_create_by(name: new)
      self.tags << new_site_tag
    end

  end


end
