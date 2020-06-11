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

ActiveRecord::Schema.define(version: 2020_04_08_171609) do

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shows_count"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "watchlist_id"
    t.integer "show_id"
    t.integer "user_id"
    t.string "user_status"
    t.integer "user_season"
    t.boolean "fav", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_genres", force: :cascade do |t|
    t.integer "show_id"
    t.integer "genre_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "channel_id"
    t.string "day"
    t.string "time"
    t.integer "current_season"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "username"
    t.string "image"
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
