class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :site_id, null: false
      t.integer :end_user_id, null: false
      t.timestamps
      t.index [:site_id, :end_user_id], unique: true
    end
  end
end
