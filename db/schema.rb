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

ActiveRecord::Schema.define(version: 20141210105936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dev_activities", force: true do |t|
    t.integer  "user_id"
    t.string   "dev_type",              null: false
    t.datetime "activity_completed_at"
    t.decimal  "time_taken"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key_learning_point"
    t.boolean  "self_directed"
    t.string   "development_subject"
  end

  add_index "dev_activities", ["user_id"], name: "index_dev_activities_on_user_id", using: :btree

  create_table "linemanagers", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_skills", force: true do |t|
    t.integer  "skill_id",   null: false
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role_name",        null: false
    t.string   "role_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.integer  "skill_group_id"
    t.string   "skill_name",     null: false
    t.string   "skill_code"
    t.string   "skill_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["skill_group_id"], name: "index_skills_on_skill_group_id", using: :btree

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.string   "skill_level",    null: false
    t.string   "date_last_used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "surname",                             null: false
    t.string   "password_temp"
    t.boolean  "admin"
    t.integer  "role_id"
    t.boolean  "line_manager"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "users_linemanagers", force: true do |t|
    t.integer  "user_id"
    t.integer  "linemanager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
