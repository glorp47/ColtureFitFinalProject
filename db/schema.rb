# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151215185552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.integer  "band_id",    null: false
    t.string   "title",      null: false
    t.text     "long_bio"
    t.datetime "date_made",  null: false
    t.string   "link_src"
    t.string   "img_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id", using: :btree
  add_index "albums", ["date_made"], name: "index_albums_on_date_made", using: :btree
  add_index "albums", ["title"], name: "index_albums_on_title", using: :btree

  create_table "bands", force: :cascade do |t|
    t.integer  "fan_id",      null: false
    t.text     "discography"
    t.string   "genre",       null: false
    t.text     "members"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bands", ["fan_id"], name: "index_bands_on_fan_id", unique: true, using: :btree
  add_index "bands", ["genre"], name: "index_bands_on_genre", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "band_id",    null: false
    t.integer  "gig_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookings", ["band_id"], name: "index_bookings_on_band_id", using: :btree
  add_index "bookings", ["gig_id"], name: "index_bookings_on_gig_id", using: :btree

  create_table "fans", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "short_bio"
    t.text     "long_bio"
    t.integer  "location_zip",    null: false
    t.string   "account_type",    null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "fans", ["email"], name: "index_fans_on_email", unique: true, using: :btree
  add_index "fans", ["location_zip"], name: "index_fans_on_location_zip", using: :btree
  add_index "fans", ["session_token"], name: "index_fans_on_session_token", using: :btree
  add_index "fans", ["username"], name: "index_fans_on_username", using: :btree

  create_table "gigs", force: :cascade do |t|
    t.integer  "venue_id",    null: false
    t.string   "title",       null: false
    t.datetime "date",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "gigs", ["date"], name: "index_gigs_on_date", using: :btree
  add_index "gigs", ["title"], name: "index_gigs_on_title", using: :btree
  add_index "gigs", ["venue_id"], name: "index_gigs_on_venue_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "fan_id",     null: false
    t.string   "title"
    t.text     "long_bio"
    t.datetime "date_made"
    t.string   "link_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["fan_id"], name: "index_images_on_fan_id", using: :btree

  create_table "press_items", force: :cascade do |t|
    t.integer  "fan_id",     null: false
    t.string   "title",      null: false
    t.string   "publisher",  null: false
    t.text     "body",       null: false
    t.datetime "date_made"
    t.string   "link_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "press_items", ["fan_id"], name: "index_press_items_on_fan_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.integer  "band_id",    null: false
    t.integer  "album_id"
    t.string   "title",      null: false
    t.text     "long_bio"
    t.datetime "date_made",  null: false
    t.string   "link_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["band_id"], name: "index_songs_on_band_id", using: :btree
  add_index "songs", ["date_made"], name: "index_songs_on_date_made", using: :btree
  add_index "songs", ["title"], name: "index_songs_on_title", using: :btree

  create_table "venues", force: :cascade do |t|
    t.integer  "fan_id",     null: false
    t.decimal  "geo_lat",    null: false
    t.decimal  "geo_lng",    null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venues", ["fan_id"], name: "index_venues_on_fan_id", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "fan_id",     null: false
    t.integer  "album_id"
    t.string   "title",      null: false
    t.text     "long_bio"
    t.datetime "date_made",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "videos", ["album_id"], name: "index_videos_on_album_id", using: :btree
  add_index "videos", ["date_made"], name: "index_videos_on_date_made", using: :btree
  add_index "videos", ["fan_id"], name: "index_videos_on_fan_id", using: :btree
  add_index "videos", ["title"], name: "index_videos_on_title", using: :btree

end
