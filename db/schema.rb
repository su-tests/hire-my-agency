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

ActiveRecord::Schema.define(version: 20150825161734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "status"
    t.float    "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees_skills", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "skill_id"
  end

  add_index "employees_skills", ["employee_id", "skill_id"], name: "index_employees_skills_on_employee_id_and_skill_id", unique: true, using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.float    "expires_in_days"
    t.float    "salary"
    t.text     "contacts"
    t.datetime "expires_at"
    t.integer  "skills_cnt",      default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "jobs_skills", force: :cascade do |t|
    t.integer "job_id"
    t.integer "skill_id"
  end

  add_index "jobs_skills", ["job_id", "skill_id"], name: "index_jobs_skills_on_job_id_and_skill_id", unique: true, using: :btree

  create_table "skills", force: :cascade do |t|
    t.string "title"
  end

  add_foreign_key "employees_skills", "employees"
  add_foreign_key "employees_skills", "skills"
  add_foreign_key "jobs_skills", "jobs"
  add_foreign_key "jobs_skills", "skills"
end
