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

ActiveRecord::Schema.define(version: 20140515141252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inspections", force: true do |t|
    t.integer "restaurant_id"
    t.integer "score"
    t.string  "violation"
    t.date    "inspected_on"
  end

  create_table "restaurants", force: true do |t|
    t.integer  "camis",      null: false
    t.string   "name"
    t.string   "address"
    t.integer  "zip"
    t.string   "boro"
    t.string   "grade"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants_users", force: true do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
  end

  create_table "users", force: true do |t|
    t.string   "user",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "violations", force: true do |t|
    t.string   "violation_code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
