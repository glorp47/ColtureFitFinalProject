class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :band_id, null: false
      t.integer :gig_id, null: false
      t.timestamps null: false
    end
    add_index :bookings, :band_id
    add_index :bookings, :gig_id
  end
end
