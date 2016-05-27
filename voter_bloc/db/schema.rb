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

ActiveRecord::Schema.define(version: 20160527201256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "commenter_id"
    t.integer  "team_id"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "elections", force: :cascade do |t|
    t.date     "date"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "election_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "organizer_id"
    t.string   "name"
    t.string   "location"
    t.integer  "membership_goal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "full_address"
    t.integer  "voter_registration_status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "election_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
