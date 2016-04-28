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

ActiveRecord::Schema.define(version: 20160427224304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.string   "user_id"
    t.string   "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "room_members", force: :cascade do |t|
    t.string  "room_id"
    t.string  "room_members_id"
    t.string  "drink"
    t.decimal "price"
    t.boolean "drink_purchased"
    t.boolean "runner_paid"
  end

  add_index "room_members", ["room_id"], name: "index_room_members_on_room_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string "room_id"
    t.string "runner_id"
  end

  add_index "rooms", ["room_id"], name: "index_rooms_on_room_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "venmo_id"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
