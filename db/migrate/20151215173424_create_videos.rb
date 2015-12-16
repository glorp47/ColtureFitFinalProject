class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :fan_id, null: false
      t.integer :album_id
      t.string :title, null: false
      t.text :long_bio
      t.datetime :date_made, null: false
      t.timestamps null: false
    end
    add_index :videos, :fan_id
    add_index :videos, :album_id
    add_index :videos, :title
    add_index :videos, :date_made
  end
end
