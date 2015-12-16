class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|

      t.integer :venue_id, null: false
      t.string :title, null: false
      t.datetime :date, null: false
      t.text :description, null: false
      t.timestamps null: false
    end
    add_index :gigs, :venue_id
    add_index :gigs, :title
    add_index :gigs, :date
  end
end
