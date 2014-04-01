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

ActiveRecord::Schema.define(version: 20140402124344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "semester"
    t.string   "subject_1"
    t.string   "subject_2"
    t.string   "subject_3"
    t.string   "subject_4"
    t.string   "subject_5"
    t.string   "subject_6"
    t.string   "subject_7"
    t.string   "subject_8"
    t.string   "subject_9"
    t.string   "subject_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "designation"
    t.string   "department"
    t.integer  "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  create_table "faculties", force: true do |t|
    t.string   "name"
    t.string   "designation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculty_courses", force: true do |t|
    t.integer  "course_id"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.string   "student_name"
    t.string   "student_roll_no"
    t.string   "course"
    t.string   "semester"
    t.float    "subject_1"
    t.float    "subject_2"
    t.float    "subject_3"
    t.float    "subject_4"
    t.float    "subject_5"
    t.float    "subject_6"
    t.float    "subject_7"
    t.float    "subject_8"
    t.float    "subject_9"
    t.float    "subject_10"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  create_table "students", force: true do |t|
    t.string   "name"
    t.date     "dob"
    t.date     "joining_date"
    t.integer  "course_id"
    t.string   "roll_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "user_id"
    t.integer  "resource_id"
    t.string   "role"

    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "calendars", force: true do |t|
    t.string   "course"
    t.string   "semester"
    t.string   "event"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
end
