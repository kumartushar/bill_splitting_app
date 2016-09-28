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

ActiveRecord::Schema.define(version: 20160927132843) do

  create_table "bill_events", force: true do |t|
    t.text     "event_type"
    t.date     "event_date"
    t.text     "location"
    t.decimal  "total_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_presentees", force: true do |t|
    t.integer  "user_id"
    t.integer  "bill_event_id"
    t.decimal  "contribution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_presentees", ["bill_event_id"], name: "index_event_presentees_on_bill_event_id"
  add_index "event_presentees", ["user_id"], name: "index_event_presentees_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
