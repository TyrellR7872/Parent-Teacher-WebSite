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

ActiveRecord::Schema.define(version: 20180411235521) do

<<<<<<< HEAD
# Could not dump table "calendar_events" because of following StandardError
#   Unknown type 'array' for column 'volunteer_list'
=======
  create_table "calendar_events", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.datetime "start_date_time", null: false
    t.datetime "end_date_time", null: false
    t.text "location", null: false
    t.boolean "is_sport"
    t.boolean "is_musical"
    t.boolean "is_meeting"
    t.boolean "is_charity"
    t.boolean "is_approved", null: false
    t.boolean "is_gathering"
    t.boolean "is_optional"
    t.boolean "for_teacher"
    t.boolean "for_parent"
    t.boolean "for_student"
    t.boolean "for_family"
    t.boolean "for_elementary_student"
    t.boolean "for_highschool_student"
    t.text "contact_person", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> 47a67e901809ae3e9e38814948b7e25000611b2e

  create_table "user_accounts", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "accounttype"
    t.string "name"
    t.string "childname"
    t.integer "childgrade"
    t.string "homeaddress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
