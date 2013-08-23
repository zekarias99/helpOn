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

ActiveRecord::Schema.define(version: 20130823202505) do

  create_table "charities", force: true do |t|
    t.string   "charity_name"
    t.string   "registered_charity_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "email_address"
    t.integer  "telephone_number"
    t.boolean  "i_agree_to_the"
    t.text     "description"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "website"
    t.string   "pick_a_category"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charities", ["city_id"], name: "index_charities_on_city_id"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "search_name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "companies", force: true do |t|
    t.string   "business_name"
    t.string   "email_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "website"
    t.string   "pick_a_category"
    t.string   "where_do_you_want_your_helpon_to_run"
    t.string   "review_links"
    t.string   "tell_us_a_little_bit_about_your_business"
    t.integer  "city_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["city_id"], name: "index_companies_on_city_id"
  add_index "companies", ["deal_id"], name: "index_companies_on_deal_id"

  create_table "deals", force: true do |t|
    t.string   "name"
    t.integer  "regular_price"
    t.integer  "initial_discount"
    t.integer  "max_discount"
    t.integer  "max_threshold"
    t.boolean  "approved",           default: false
    t.date     "deal_date"
    t.string   "blurb_title"
    t.text     "blurb"
    t.string   "deal_type"
    t.integer  "tipping_point"
    t.date     "end_date"
    t.integer  "city_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "deals", ["city_id"], name: "index_deals_on_city_id"
  add_index "deals", ["company_id"], name: "index_deals_on_company_id"

  create_table "fine_prints", force: true do |t|
    t.string   "description"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fine_prints", ["deal_id"], name: "index_fine_prints_on_deal_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true

  create_table "highlights", force: true do |t|
    t.string   "description"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "highlights", ["deal_id"], name: "index_highlights_on_deal_id"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.integer  "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statuses", ["user_id", "created_at"], name: "index_statuses_on_user_id_and_created_at"

  create_table "user_friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_friendships", ["user_id", "friend_id"], name: "index_user_friendships_on_user_id_and_friend_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
