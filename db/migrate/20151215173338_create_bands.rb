class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.integer :fan_id, null: false
      t.text :discography
      t.string :genre, null: false
      t.text :members
      t.timestamps null: false
    end
    add_index :bands, :fan_id, unique: true
    add_index :bands, :genre
  end
end
