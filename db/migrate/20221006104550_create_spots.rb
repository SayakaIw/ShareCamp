class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :address, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.references :site_id, null:false
      t.timestamps
    end
  end
end
