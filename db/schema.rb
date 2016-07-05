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

ActiveRecord::Schema.define(version: 20160704161505) do

  create_table "message_groups", force: :cascade do |t|
    t.integer  "sell_book_id", null: false
    t.integer  "seller_id",    null: false
    t.integer  "buyer_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "message_groups", ["buyer_id"], name: "index_message_groups_on_buyer_id"
  add_index "message_groups", ["sell_book_id"], name: "index_message_groups_on_sell_book_id"
  add_index "message_groups", ["seller_id"], name: "index_message_groups_on_seller_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "message_group_id", null: false
    t.text     "body",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "messages", ["message_group_id"], name: "index_messages_on_message_group_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sell_book_comments", force: :cascade do |t|
    t.integer  "sell_book_id", null: false
    t.integer  "user_id",      null: false
    t.text     "body",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sell_book_comments", ["sell_book_id"], name: "index_sell_book_comments_on_sell_book_id"
  add_index "sell_book_comments", ["user_id"], name: "index_sell_book_comments_on_user_id"

  create_table "sell_books", force: :cascade do |t|
    t.string   "name",           default: "",    null: false
    t.string   "prof_name",      default: "",    null: false
    t.boolean  "in_class",       default: true
    t.string   "class_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "price"
    t.integer  "user_id"
    t.boolean  "deanza_flag",    default: false
    t.boolean  "foothill_flag",  default: false
    t.text     "description"
    t.boolean  "sell_now_flag",  default: false
    t.boolean  "sell_next_flag", default: false
    t.boolean  "active_flag",    default: true,  null: false
  end

  create_table "user_lessons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "uid",                 limit: 8
    t.string   "name"
    t.string   "provider"
    t.string   "email"
    t.string   "school_name"
    t.string   "encrypted_password"
    t.string   "facebook_url"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
