class ChangeDatatypeSiteTypeOfSites < ActiveRecord::Migration[6.1]
  def change
    change_column :sites, :site_type, :integer
  end
end
