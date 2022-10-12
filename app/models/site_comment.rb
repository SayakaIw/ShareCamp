class SiteComment < ApplicationRecord

  belongs_to :end_user
  belongs_to :site

end
