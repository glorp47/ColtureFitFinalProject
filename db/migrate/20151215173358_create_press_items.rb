class CreatePressItems < ActiveRecord::Migration
  def change
    create_table :press_items do |t|
      t.integer :fan_id, null: false
      t.string :title, null: false
      t.string :publisher, null: false
      t.text :body, null: false
      t.datetime :date_made
      t.string :link_src
      t.timestamps null: false
    end
    add_index :press_items, :fan_id
  end
end
