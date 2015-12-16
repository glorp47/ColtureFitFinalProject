class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :short_bio
      t.text :long_bio
      t.integer :location_zip, null: false
      t.string :account_type, null: false
      t.timestamps null: false
    end
    add_index :fans, :email, unique: true
    add_index :fans, :username
    add_index :fans, :session_token
    add_index :fans, :location_zip
  end
end
