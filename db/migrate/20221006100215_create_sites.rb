class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.integer :end_user_id, null: false
      t.string :name, null: false
      t.integer :prefecture, null: false, default: 0
      t.string :site_type, null: false
      t.integer :field_type, null: false, default: 0
      t.integer :daycamp, null: false, default: 0
      t.string :local_specialty, null: false
      t.string :url, null: false
      t.text :review, null: false
      t.timestamps
    end
  end
end
