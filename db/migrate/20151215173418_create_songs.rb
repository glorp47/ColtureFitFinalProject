class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :band_id, null: false
      t.integer :album_id
      t.string :title, null: false
      t.text :long_bio
      t.datetime :date_made, null: false
      t.string :link_src
      t.timestamps null: false
    end
    add_index :songs, :band_id
    add_index :songs, :album_id
    add_index :songs, :title 
    add_index :songs, :date_made
  end
end
