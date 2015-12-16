class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.text :long_bio
      t.datetime :date_made, null: false
      t.string :link_src
      t.string :img_src
      t.timestamps null: false
    end
    add_index :albums, :band_id
    add_index :albums, :title
    add_index :albums, :date_made
  end
end
