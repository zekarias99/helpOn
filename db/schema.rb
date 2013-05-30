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

ActiveRecord::Schema.define(version: 20130529175658) do

  create_table "companies", force: true do |t|
    t.string   "business_name"
    t.string   "email_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_1"
    t.string   "address_2"
    t.integer  "city_id"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "website"
    t.string   "pick_a_category"
    t.string   "where_do_you_want_your_helpon_to_run"
    t.string   "review_links"
    t.string   "tell_us_a_little_bit_about_your_business"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: true do |t|
    t.string   "name"
    t.integer  "regular_price"
    t.integer  "initial_discount"
    t.integer  "max_discount"
    t.integer  "max_threshold"
    t.boolean  "approved"
    t.date     "deal_date"
    t.string   "photo_file_name"
    t.string   "blurb_title"
    t.text     "blurb"
    t.string   "deal_type"
    t.integer  "tipping_point"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fine_prints", force: true do |t|
    t.string   "description"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "highlights", force: true do |t|
    t.string   "description"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
