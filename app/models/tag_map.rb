class TagMap < ApplicationRecord
  # tag_mapsテーブルは、sitesテーブルとtagsテーブルに属している
  belongs_to :site
  belongs_to :tag

  # 念のためのバリデーション
  validates :site_id, presence: true
  validates :tag_id, presence: true
end
