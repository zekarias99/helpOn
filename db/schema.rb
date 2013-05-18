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

ActiveRecord::Schema.define(version: 20130516042737) do

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

end