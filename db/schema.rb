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

ActiveRecord::Schema.define(version: 20161117134254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "description"
    t.string   "hour"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_scopes", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "scope_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_scopes", ["project_id"], name: "index_project_scopes_on_project_id", using: :btree
  add_index "project_scopes", ["scope_id"], name: "index_project_scopes_on_scope_id", using: :btree

  create_table "project_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.date     "registry_date"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city_hall"
    t.string   "important"
    t.string   "status"
    t.string   "assessment"
    t.string   "work_place"
    t.string   "manager"
    t.string   "manager_telf"
    t.integer  "voluntaries_num"
    t.string   "profile"
    t.string   "cooperation_agreement"
    t.integer  "district_id"
    t.integer  "proposal_id"
    t.integer  "project_type_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "projects", ["district_id"], name: "index_projects_on_district_id", using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree
  add_index "projects", ["proposal_id"], name: "index_projects_on_proposal_id", using: :btree

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.text     "comments"
    t.date     "registry_date"
    t.date     "approval_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "scopes", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "locale"
    t.integer  "profile_id"
    t.string   "profile_type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voluntaries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "projects"
  add_foreign_key "project_scopes", "projects"
  add_foreign_key "project_scopes", "scopes"
  add_foreign_key "projects", "districts"
  add_foreign_key "projects", "project_types"
  add_foreign_key "projects", "proposals"
end
