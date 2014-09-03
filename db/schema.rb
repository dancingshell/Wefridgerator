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

ActiveRecord::Schema.define(version: 20140903193041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arts", force: true do |t|
    t.string   "json"
    t.integer  "user_id"
    t.integer  "container_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "arts", ["container_id"], name: "index_arts_on_container_id", using: :btree
  add_index "arts", ["user_id"], name: "index_arts_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "group_id"
  end

  add_index "categories", ["group_id"], name: "index_categories_on_group_id", using: :btree

  create_table "chatrooms", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chatrooms", ["group_id"], name: "index_chatrooms_on_group_id", using: :btree
  add_index "chatrooms", ["user_id"], name: "index_chatrooms_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "passcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "container_type"
    t.boolean  "is_private"
    t.datetime "exp_date"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "chatroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree

  create_table "receipts", force: true do |t|
    t.string   "location"
    t.integer  "amount"
    t.datetime "purchase_date"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipts", ["group_id"], name: "index_receipts_on_group_id", using: :btree
  add_index "receipts", ["user_id"], name: "index_receipts_on_user_id", using: :btree

  create_table "shopping_lists", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shopping_lists", ["group_id"], name: "index_shopping_lists_on_group_id", using: :btree
  add_index "shopping_lists", ["user_id"], name: "index_shopping_lists_on_user_id", using: :btree

  create_table "user_groups", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id", using: :btree
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
