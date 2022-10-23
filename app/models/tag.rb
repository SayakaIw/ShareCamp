class Tag < ApplicationRecord
  # tag_mapsと関連付けを行い、tag_mapsのテーブルを通しsitesテーブルと関連づけ
  #   dependent: :destroyをつけることで、タグが削除された時にタグの関連付けを削除する
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'

  # postsのアソシエーション
  #   Tag.sitesとすれば、タグに紐付けられたsiteを取得可能になる
  has_many :sites, through: :tag_maps
end
