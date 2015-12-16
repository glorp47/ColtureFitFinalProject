class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :fan_id, null: false
      t.decimal :geo_lat, null: false
      t.decimal :geo_lng, null: false
      t.string :address, null: false
      t.timestamps null: false
    end
    add_index :venues, :fan_id, unique: true
  end
end
