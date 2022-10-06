class CreateSiteComments < ActiveRecord::Migration[6.1]
  def change
    create_table :site_comments do |t|
      t.integer :site_id, null: false
      t.integer :end_user_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
