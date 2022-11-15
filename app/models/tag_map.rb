class TagMap < ApplicationRecord

  belongs_to :site
  belongs_to :tag

  validates :site_id, presence: true
  validates :tag_id, presence: true
end
