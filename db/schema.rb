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

ActiveRecord::Schema.define(version: 20150214025744) do

  create_table "comments", force: :cascade do |t|
    t.string   "text",             limit: 255
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "exchanges", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "place_id"
  end

  add_index "exchanges", ["buyer_id"], name: "index_exchanges_on_buyer_id"
  add_index "exchanges", ["place_id"], name: "index_exchanges_on_place_id"
  add_index "exchanges", ["post_id"], name: "index_exchanges_on_post_id"
  add_index "exchanges", ["seller_id"], name: "index_exchanges_on_seller_id"

  create_table "followed_tags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "exchange_id"
    t.integer  "time_block_id"
    t.boolean  "planned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetings", ["exchange_id"], name: "index_meetings_on_exchange_id"
  add_index "meetings", ["time_block_id"], name: "index_meetings_on_time_block_id"

  create_table "networks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "amount"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "user_id"
  end

  add_index "offers", ["post_id"], name: "index_offers_on_post_id"
  add_index "offers", ["user_id"], name: "index_offers_on_user_id"

  create_table "places", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.text     "description"
    t.integer  "user_id"
    t.string   "picture",     limit: 255
    t.float    "score"
    t.boolean  "active"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "time_blocks", force: :cascade do |t|
    t.datetime "start_time"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_blocks", ["meeting_id"], name: "index_time_blocks_on_meeting_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
