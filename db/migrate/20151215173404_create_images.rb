class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :fan_id, null: false
      t.string :title
      t.text :long_bio
      t.datetime :date_made
      t.string :link_src
      t.timestamps null: false
    end
    add_index :images, :fan_id
  end
end
