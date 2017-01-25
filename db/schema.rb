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

ActiveRecord::Schema.define(version: 20170125091226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_levels", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "educational_type",                null: false
    t.boolean  "active",           default: true, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "academic_levels", ["name"], name: "index_academic_levels_on_name", unique: true, using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "description",                 null: false
    t.datetime "start_date",                  null: false
    t.datetime "end_date"
    t.text     "transport",                   null: false
    t.string   "pdf_url"
    t.integer  "entity_id"
    t.integer  "area_id"
    t.integer  "project_id"
    t.boolean  "share",       default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "activities", ["area_id"], name: "index_activities_on_area_id", using: :btree
  add_index "activities", ["entity_id"], name: "index_activities_on_entity_id", using: :btree
  add_index "activities", ["name"], name: "index_activities_on_name", unique: true, using: :btree
  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "road_number_type"
    t.string   "road_number"
    t.string   "grader"
    t.string   "stairs"
    t.string   "floor"
    t.string   "door"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.string   "country"
    t.string   "ndp_code"
    t.string   "local_code"
    t.string   "class_name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["district_id"], name: "index_addresses_on_district_id", using: :btree
  add_index "addresses", ["province_id"], name: "index_addresses_on_province_id", using: :btree
  add_index "addresses", ["road_type_id"], name: "index_addresses_on_road_type_id", using: :btree

  create_table "addresses_volunteers", id: false, force: :cascade do |t|
    t.integer "address_id",   null: false
    t.integer "volunteer_id", null: false
  end

  add_index "addresses_volunteers", ["address_id", "volunteer_id"], name: "index_addresses_volunteers_on_address_id_and_volunteer_id", using: :btree
  add_index "addresses_volunteers", ["volunteer_id", "address_id"], name: "index_addresses_volunteers_on_volunteer_id_and_address_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description"
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "areas", ["name"], name: "index_areas_on_name", unique: true, using: :btree

  create_table "areas_projects", id: false, force: :cascade do |t|
    t.integer "area_id",    null: false
    t.integer "project_id", null: false
  end

  add_index "areas_projects", ["area_id", "project_id"], name: "index_areas_projects_on_area_id_and_project_id", using: :btree
  add_index "areas_projects", ["project_id", "area_id"], name: "index_areas_projects_on_project_id_and_area_id", using: :btree

  create_table "areas_volunteers", id: false, force: :cascade do |t|
    t.integer "area_id",      null: false
    t.integer "volunteer_id", null: false
  end

  add_index "areas_volunteers", ["area_id", "volunteer_id"], name: "index_areas_volunteers_on_area_id_and_volunteer_id", using: :btree
  add_index "areas_volunteers", ["volunteer_id", "area_id"], name: "index_areas_volunteers_on_volunteer_id_and_area_id", using: :btree

  create_table "boroughs", force: :cascade do |t|
    t.string   "name"
    t.string   "active"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "boroughs", ["district_id"], name: "index_boroughs_on_district_id", using: :btree

  create_table "collectives", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description"
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "collectives", ["name"], name: "index_collectives_on_name", unique: true, using: :btree

  create_table "collectives_projects", id: false, force: :cascade do |t|
    t.integer "collective_id", null: false
    t.integer "project_id",    null: false
  end

  add_index "collectives_projects", ["collective_id", "project_id"], name: "index_collectives_projects_on_collective_id_and_project_id", using: :btree
  add_index "collectives_projects", ["project_id", "collective_id"], name: "index_collectives_projects_on_project_id_and_collective_id", using: :btree

  create_table "contact_results", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "contact_results", ["name"], name: "index_contact_results_on_name", unique: true, using: :btree

  create_table "contact_types", force: :cascade do |t|
    t.string   "name"
    t.string   "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinations", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description"
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "coordinations", ["name"], name: "index_coordinations_on_name", unique: true, using: :btree

  create_table "coordinations_projects", id: false, force: :cascade do |t|
    t.integer "coordination_id", null: false
    t.integer "project_id",      null: false
  end

  add_index "coordinations_projects", ["coordination_id", "project_id"], name: "index_coordinations_projects_on_coordination_id_and_project_id", using: :btree
  add_index "coordinations_projects", ["project_id", "coordination_id"], name: "index_coordinations_projects_on_project_id_and_coordination_id", using: :btree

  create_table "degree_types", force: :cascade do |t|
    t.string   "name"
    t.string   "educational_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "degrees", ["name"], name: "index_degrees_on_name", unique: true, using: :btree

  create_table "degrees_volunteers", id: false, force: :cascade do |t|
    t.integer "degree_id",    null: false
    t.integer "volunteer_id", null: false
  end

  add_index "degrees_volunteers", ["degree_id", "volunteer_id"], name: "index_degrees_volunteers_on_degree_id_and_volunteer_id", using: :btree
  add_index "degrees_volunteers", ["volunteer_id", "degree_id"], name: "index_degrees_volunteers_on_volunteer_id_and_degree_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "districts", ["code"], name: "index_districts_on_code", unique: true, using: :btree
  add_index "districts", ["name"], name: "index_districts_on_name", unique: true, using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "documentum_id"
    t.integer  "project_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "documents", ["name"], name: "index_documents_on_name", unique: true, using: :btree
  add_index "documents", ["project_id"], name: "index_documents_on_project_id", using: :btree

  create_table "employment_statuses", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "employment_statuses", ["name"], name: "index_employment_statuses_on_name", unique: true, using: :btree

  create_table "ent_trackings", force: :cascade do |t|
    t.integer  "tracking_type_id", null: false
    t.integer  "entity_id",        null: false
    t.integer  "manager_id"
    t.datetime "tracked_at",       null: false
    t.text     "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "ent_trackings", ["entity_id"], name: "index_ent_trackings_on_entity_id", using: :btree
  add_index "ent_trackings", ["manager_id"], name: "index_ent_trackings_on_manager_id", using: :btree
  add_index "ent_trackings", ["tracking_type_id"], name: "index_ent_trackings_on_tracking_type_id", using: :btree

  create_table "entities", force: :cascade do |t|
    t.string   "name",                                         null: false
    t.text     "description"
    t.string   "vat_number"
    t.string   "email",                                        null: false
    t.string   "representative_name",                          null: false
    t.string   "representative_last_name",                     null: false
    t.string   "representative_last_name_alt"
    t.string   "contact_name",                                 null: false
    t.string   "contact_last_name",                            null: false
    t.string   "contact_last_name_alt"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.boolean  "publish_pictures",             default: true
    t.boolean  "annual_survey",                default: false
    t.integer  "request_reason_id"
    t.integer  "entity_type_id",                               null: false
    t.text     "comments"
    t.text     "other_subscribe_reason"
    t.integer  "address_id",                                   null: false
    t.boolean  "active",                       default: true
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "entities", ["address_id"], name: "index_entities_on_address_id", using: :btree
  add_index "entities", ["entity_type_id"], name: "index_entities_on_entity_type_id", using: :btree
  add_index "entities", ["name"], name: "index_entities_on_name", unique: true, using: :btree
  add_index "entities", ["request_reason_id"], name: "index_entities_on_request_reason_id", using: :btree

  create_table "entities_projects", id: false, force: :cascade do |t|
    t.integer "entity_id",  null: false
    t.integer "project_id", null: false
  end

  add_index "entities_projects", ["entity_id", "project_id"], name: "index_entities_projects_on_entity_id_and_project_id", using: :btree
  add_index "entities_projects", ["project_id", "entity_id"], name: "index_entities_projects_on_project_id_and_entity_id", using: :btree

  create_table "entity_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "entity_types", ["kind"], name: "index_entity_types_on_kind", unique: true, using: :btree

  create_table "event_types", force: :cascade do |t|
    t.integer  "kind",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "event_types", ["kind"], name: "index_event_types_on_kind", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.boolean  "publish",        default: true
    t.integer  "eventable_id",                  null: false
    t.string   "eventable_type",                null: false
    t.integer  "event_type_id"
    t.integer  "address_id",                    null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "events", ["address_id"], name: "index_events_on_address_id", using: :btree
  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree
  add_index "events", ["eventable_type", "eventable_id"], name: "index_events_on_eventable_type_and_eventable_id", using: :btree

  create_table "id_number_types", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "id_number_types", ["name"], name: "index_id_number_types_on_name", unique: true, using: :btree

  create_table "info_sources", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "info_sources", ["name"], name: "index_info_sources_on_name", unique: true, using: :btree

  create_table "language_levels", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "language_levels", ["name"], name: "index_language_levels_on_name", unique: true, using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true, using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.text     "description"
    t.integer  "kind"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "links", ["linkable_type", "linkable_id"], name: "index_links_on_linkable_type_and_linkable_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "profile_id"
    t.string   "phone_number"
    t.boolean  "active",       default: true, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "motivations", force: :cascade do |t|
    t.string   "name"
    t.string   "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "nationalities", ["name"], name: "index_nationalities_on_name", unique: true, using: :btree

  create_table "notice_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "notice_types", ["kind"], name: "index_notice_types_on_kind", unique: true, using: :btree

  create_table "pro_issues", force: :cascade do |t|
    t.text     "comments"
    t.datetime "start_date"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pro_issues", ["project_id"], name: "index_pro_issues_on_project_id", using: :btree

  create_table "pro_trackings", force: :cascade do |t|
    t.text     "comments"
    t.datetime "start_date"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pro_trackings", ["project_id"], name: "index_pro_trackings_on_project_id", using: :btree

  create_table "professions", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "professions", ["name"], name: "index_professions_on_name", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "profiles", ["name"], name: "index_profiles_on_name", unique: true, using: :btree

  create_table "project_types", force: :cascade do |t|
    t.integer  "kind",                       null: false
    t.text     "description",                null: false
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "project_types", ["kind"], name: "index_project_types_on_kind", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.boolean  "active",                default: true,  null: false
    t.text     "description",                           null: false
    t.string   "functions"
    t.date     "execution_start_date",                  null: false
    t.date     "execution_end_date"
    t.string   "contact_name",                          null: false
    t.string   "contact_last_name",                     null: false
    t.string   "contact_last_name_alt"
    t.string   "phone_number",                          null: false
    t.string   "phone_number_alt"
    t.string   "email",                                 null: false
    t.text     "comments"
    t.integer  "beneficiaries_num"
    t.integer  "volunteers_num"
    t.boolean  "insured",               default: false
    t.boolean  "volunteers_allowed",    default: true
    t.boolean  "publish",               default: true
    t.boolean  "outstanding",           default: false
    t.date     "insurance_date"
    t.integer  "project_type_id",                       null: false
    t.integer  "pt_extendable_id"
    t.string   "pt_extendable_type"
    t.integer  "entity_id",                             null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "projects", ["entity_id"], name: "index_projects_on_entity_id", using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", unique: true, using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree
  add_index "projects", ["pt_extendable_type", "pt_extendable_id"], name: "index_projects_on_pt_extendable_type_and_pt_extendable_id", using: :btree

  create_table "projects_volunteers", id: false, force: :cascade do |t|
    t.integer "project_id",   null: false
    t.integer "volunteer_id", null: false
  end

  add_index "projects_volunteers", ["project_id", "volunteer_id"], name: "index_projects_volunteers_on_project_id_and_volunteer_id", using: :btree
  add_index "projects_volunteers", ["volunteer_id", "project_id"], name: "index_projects_volunteers_on_volunteer_id_and_project_id", using: :btree

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "proposals", ["name"], name: "index_proposals_on_name", unique: true, using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "provinces", ["code"], name: "index_provinces_on_code", unique: true, using: :btree
  add_index "provinces", ["name"], name: "index_provinces_on_name", unique: true, using: :btree

  create_table "pt_entities", force: :cascade do |t|
    t.date     "request_date"
    t.text     "request_description"
    t.string   "volunteers_profile"
    t.text     "activities"
    t.date     "sav_date"
    t.integer  "derived_volunteers_num"
    t.integer  "added_volunteers_num"
    t.boolean  "agreement_signed",       default: false
    t.date     "agreement_date"
    t.boolean  "prevailing",             default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "pt_subventions", force: :cascade do |t|
    t.string   "representative_name"
    t.string   "representative_last_name"
    t.string   "representative_last_name_alt"
    t.string   "id_num"
    t.string   "vat_number"
    t.boolean  "entity_registry",              default: false
    t.float    "cost"
    t.float    "requested_amount"
    t.float    "subsidized_amount"
    t.integer  "initial_volunteers_num"
    t.integer  "participants_num"
    t.boolean  "has_quality_evaluation",       default: false
    t.integer  "proposal_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "pt_subventions", ["proposal_id"], name: "index_pt_subventions_on_proposal_id", using: :btree

  create_table "record_histories", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.integer  "recordable_id",         null: false
    t.string   "recordable_type",       null: false
    t.datetime "recordable_changed_at", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "record_histories", ["recordable_type", "recordable_id"], name: "index_record_histories_on_recordable_type_and_recordable_id", using: :btree
  add_index "record_histories", ["user_id"], name: "index_record_histories_on_user_id", using: :btree

  create_table "rejection_types", force: :cascade do |t|
    t.integer  "kind",                       null: false
    t.text     "description"
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "rejection_types", ["kind"], name: "index_rejection_types_on_kind", unique: true, using: :btree

  create_table "request_forms", force: :cascade do |t|
    t.integer  "request_type_id"
    t.integer  "rt_extendable_id"
    t.string   "rt_extendable_type"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "status_date"
    t.integer  "rejection_type_id"
    t.integer  "request_reason_id"
    t.text     "comments"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "request_forms", ["rejection_type_id"], name: "index_request_forms_on_rejection_type_id", using: :btree
  add_index "request_forms", ["request_reason_id"], name: "index_request_forms_on_request_reason_id", using: :btree
  add_index "request_forms", ["request_type_id"], name: "index_request_forms_on_request_type_id", using: :btree
  add_index "request_forms", ["rt_extendable_type", "rt_extendable_id"], name: "index_request_forms_on_rt_extendable_type_and_rt_extendable_id", using: :btree
  add_index "request_forms", ["user_id"], name: "index_request_forms_on_user_id", using: :btree

  create_table "request_reasons", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "request_reasons", ["kind"], name: "index_request_reasons_on_kind", unique: true, using: :btree

  create_table "request_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "request_types", ["kind"], name: "index_request_types_on_kind", unique: true, using: :btree

  create_table "road_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "road_types", ["code"], name: "index_road_types_on_code", unique: true, using: :btree
  add_index "road_types", ["name"], name: "index_road_types_on_name", unique: true, using: :btree

  create_table "rt_activity_publishings", force: :cascade do |t|
    t.string   "name"
    t.string   "organizer"
    t.text     "description"
    t.date     "execution_date"
    t.string   "execution_hour"
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.integer  "project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "rt_activity_publishings", ["district_id"], name: "index_rt_activity_publishings_on_district_id", using: :btree
  add_index "rt_activity_publishings", ["project_id"], name: "index_rt_activity_publishings_on_project_id", using: :btree
  add_index "rt_activity_publishings", ["province_id"], name: "index_rt_activity_publishings_on_province_id", using: :btree
  add_index "rt_activity_publishings", ["road_type_id"], name: "index_rt_activity_publishings_on_road_type_id", using: :btree

  create_table "rt_activity_unpublishings", force: :cascade do |t|
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rt_entity_subscribes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "vat_number"
    t.string   "email"
    t.string   "representative_name"
    t.string   "representative_last_name"
    t.string   "representative_last_name_alt"
    t.string   "contact_name"
    t.string   "contact_last_name"
    t.string   "contact_last_name_alt"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.boolean  "publish_pictures",             default: true
    t.boolean  "annual_survey",                default: false
    t.integer  "entity_type_id"
    t.text     "comments"
    t.text     "other_subscribe_reason"
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "rt_entity_subscribes", ["district_id"], name: "index_rt_entity_subscribes_on_district_id", using: :btree
  add_index "rt_entity_subscribes", ["entity_type_id"], name: "index_rt_entity_subscribes_on_entity_type_id", using: :btree
  add_index "rt_entity_subscribes", ["province_id"], name: "index_rt_entity_subscribes_on_province_id", using: :btree
  add_index "rt_entity_subscribes", ["road_type_id"], name: "index_rt_entity_subscribes_on_road_type_id", using: :btree

  create_table "rt_entity_unsubscribes", force: :cascade do |t|
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rt_others", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rt_project_publishings", force: :cascade do |t|
    t.text     "description"
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "rt_project_publishings", ["district_id"], name: "index_rt_project_publishings_on_district_id", using: :btree
  add_index "rt_project_publishings", ["province_id"], name: "index_rt_project_publishings_on_province_id", using: :btree
  add_index "rt_project_publishings", ["road_type_id"], name: "index_rt_project_publishings_on_road_type_id", using: :btree

  create_table "rt_project_unpublishings", force: :cascade do |t|
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rt_project_unsubscribes", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rt_project_unsubscribes", ["project_id"], name: "index_rt_project_unsubscribes_on_project_id", using: :btree

  create_table "rt_volunteer_amendments", force: :cascade do |t|
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "rt_volunteer_amendments", ["district_id"], name: "index_rt_volunteer_amendments_on_district_id", using: :btree
  add_index "rt_volunteer_amendments", ["province_id"], name: "index_rt_volunteer_amendments_on_province_id", using: :btree
  add_index "rt_volunteer_amendments", ["road_type_id"], name: "index_rt_volunteer_amendments_on_road_type_id", using: :btree

  create_table "rt_volunteer_appointments", force: :cascade do |t|
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rt_volunteer_subscribes", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "last_name_alt"
    t.integer  "id_number_type_id"
    t.string   "id_number"
    t.integer  "gender"
    t.date     "birth_date"
    t.integer  "nationality_id"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.string   "email"
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.integer  "status_id"
    t.integer  "employment_status_id"
    t.boolean  "vocne",                    default: false
    t.boolean  "available",                default: false
    t.date     "availability_date"
    t.integer  "academic_level_id"
    t.text     "comments"
    t.text     "expectations"
    t.boolean  "agreement",                default: false
    t.datetime "agreement_date"
    t.boolean  "search_authorization",     default: false
    t.boolean  "representative_statement", default: false
    t.boolean  "has_driving_license",      default: false
    t.boolean  "publish_pictures",         default: true
    t.boolean  "annual_survey",            default: false
    t.integer  "info_source_id"
    t.text     "other_academic_info"
    t.integer  "profession_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "rt_volunteer_subscribes", ["academic_level_id"], name: "index_rt_volunteer_subscribes_on_academic_level_id", using: :btree
  add_index "rt_volunteer_subscribes", ["district_id"], name: "index_rt_volunteer_subscribes_on_district_id", using: :btree
  add_index "rt_volunteer_subscribes", ["employment_status_id"], name: "index_rt_volunteer_subscribes_on_employment_status_id", using: :btree
  add_index "rt_volunteer_subscribes", ["id_number_type_id"], name: "index_rt_volunteer_subscribes_on_id_number_type_id", using: :btree
  add_index "rt_volunteer_subscribes", ["info_source_id"], name: "index_rt_volunteer_subscribes_on_info_source_id", using: :btree
  add_index "rt_volunteer_subscribes", ["nationality_id"], name: "index_rt_volunteer_subscribes_on_nationality_id", using: :btree
  add_index "rt_volunteer_subscribes", ["profession_id"], name: "index_rt_volunteer_subscribes_on_profession_id", using: :btree
  add_index "rt_volunteer_subscribes", ["province_id"], name: "index_rt_volunteer_subscribes_on_province_id", using: :btree
  add_index "rt_volunteer_subscribes", ["road_type_id"], name: "index_rt_volunteer_subscribes_on_road_type_id", using: :btree
  add_index "rt_volunteer_subscribes", ["status_id"], name: "index_rt_volunteer_subscribes_on_status_id", using: :btree

  create_table "rt_volunteer_unsubscribes", force: :cascade do |t|
    t.integer  "level"
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rt_volunteers_demands", force: :cascade do |t|
    t.text     "description"
    t.date     "execution_start_date"
    t.date     "execution_end_date"
    t.integer  "road_type_id"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "borough"
    t.integer  "district_id"
    t.string   "town"
    t.integer  "province_id"
    t.string   "requested_volunteers_num"
    t.text     "volunteers_profile"
    t.text     "volunteer_functions_1"
    t.text     "volunteer_functions_2"
    t.text     "volunteer_functions_3"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rt_volunteers_demands", ["district_id"], name: "index_rt_volunteers_demands_on_district_id", using: :btree
  add_index "rt_volunteers_demands", ["province_id"], name: "index_rt_volunteers_demands_on_province_id", using: :btree
  add_index "rt_volunteers_demands", ["road_type_id"], name: "index_rt_volunteers_demands_on_road_type_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "skills", ["name"], name: "index_skills_on_name", unique: true, using: :btree

  create_table "skills_volunteers", id: false, force: :cascade do |t|
    t.integer "skill_id",     null: false
    t.integer "volunteer_id", null: false
  end

  add_index "skills_volunteers", ["skill_id", "volunteer_id"], name: "index_skills_volunteers_on_skill_id_and_volunteer_id", using: :btree
  add_index "skills_volunteers", ["volunteer_id", "skill_id"], name: "index_skills_volunteers_on_volunteer_id_and_skill_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "statuses", ["name"], name: "index_statuses_on_name", unique: true, using: :btree

  create_table "timetables", force: :cascade do |t|
    t.integer  "event_id",       null: false
    t.date     "execution_date", null: false
    t.string   "start_hour",     null: false
    t.string   "end_hour",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "timetables", ["event_id"], name: "index_timetables_on_event_id", using: :btree

  create_table "tracking_types", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tracking_types", ["name"], name: "index_tracking_types_on_name", unique: true, using: :btree

  create_table "traits", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "traits", ["name"], name: "index_traits_on_name", unique: true, using: :btree

  create_table "unsubscribe_reasons", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "unsubscribe_reasons", ["name"], name: "index_unsubscribe_reasons_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "locale"
    t.integer  "notice_type_id",                        null: false
    t.integer  "loggable_id"
    t.string   "loggable_type"
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["loggable_type", "loggable_id"], name: "index_users_on_loggable_type_and_loggable_id", using: :btree
  add_index "users", ["notice_type_id"], name: "index_users_on_notice_type_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volun_assessments", force: :cascade do |t|
    t.integer  "volunteer_id",                 null: false
    t.integer  "trait_id",                     null: false
    t.integer  "project_id",                   null: false
    t.string   "trait_other"
    t.boolean  "assessment",   default: false, null: false
    t.text     "comments"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "volun_assessments", ["project_id"], name: "index_volun_assessments_on_project_id", using: :btree
  add_index "volun_assessments", ["trait_id"], name: "index_volun_assessments_on_trait_id", using: :btree
  add_index "volun_assessments", ["volunteer_id"], name: "index_volun_assessments_on_volunteer_id", using: :btree

  create_table "volun_availabilities", force: :cascade do |t|
    t.integer  "volunteer_id", null: false
    t.string   "day",          null: false
    t.string   "start_hour"
    t.string   "end_hour"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "volun_availabilities", ["volunteer_id"], name: "index_volun_availabilities_on_volunteer_id", using: :btree

  create_table "volun_contacts", force: :cascade do |t|
    t.integer  "volunteer_id",      null: false
    t.integer  "contact_result_id", null: false
    t.integer  "project_id",        null: false
    t.integer  "manager_id",        null: false
    t.integer  "contact_type_id"
    t.datetime "contact_date",      null: false
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "volun_contacts", ["contact_result_id"], name: "index_volun_contacts_on_contact_result_id", using: :btree
  add_index "volun_contacts", ["contact_type_id"], name: "index_volun_contacts_on_contact_type_id", using: :btree
  add_index "volun_contacts", ["manager_id"], name: "index_volun_contacts_on_manager_id", using: :btree
  add_index "volun_contacts", ["project_id"], name: "index_volun_contacts_on_project_id", using: :btree
  add_index "volun_contacts", ["volunteer_id"], name: "index_volun_contacts_on_volunteer_id", using: :btree

  create_table "volun_known_languages", force: :cascade do |t|
    t.integer  "volunteer_id",      null: false
    t.integer  "language_id",       null: false
    t.integer  "language_level_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "volun_known_languages", ["language_id"], name: "index_volun_known_languages_on_language_id", using: :btree
  add_index "volun_known_languages", ["language_level_id"], name: "index_volun_known_languages_on_language_level_id", using: :btree
  add_index "volun_known_languages", ["volunteer_id"], name: "index_volun_known_languages_on_volunteer_id", using: :btree

  create_table "volun_trackings", force: :cascade do |t|
    t.integer  "volunteer_id",     null: false
    t.integer  "tracking_type_id", null: false
    t.integer  "project_id"
    t.integer  "manager_id"
    t.datetime "tracking_date",    null: false
    t.text     "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "volun_trackings", ["manager_id"], name: "index_volun_trackings_on_manager_id", using: :btree
  add_index "volun_trackings", ["project_id"], name: "index_volun_trackings_on_project_id", using: :btree
  add_index "volun_trackings", ["tracking_type_id"], name: "index_volun_trackings_on_tracking_type_id", using: :btree
  add_index "volun_trackings", ["volunteer_id"], name: "index_volun_trackings_on_volunteer_id", using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "name",                                     null: false
    t.string   "last_name",                                null: false
    t.string   "last_name_alt"
    t.integer  "id_number_type_id"
    t.string   "id_number"
    t.integer  "gender"
    t.date     "birth_date"
    t.integer  "nationality_id"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.string   "email"
    t.integer  "address_id",                               null: false
    t.integer  "status_id"
    t.integer  "employment_status_id"
    t.boolean  "vocne",                    default: false
    t.boolean  "available",                default: false
    t.date     "availability_date"
    t.integer  "academic_level_id"
    t.date     "subscribe_date"
    t.date     "unsubscribe_date"
    t.integer  "unsubscribe_reason_id"
    t.text     "comments"
    t.text     "expectations"
    t.boolean  "agreement",                default: false
    t.datetime "agreement_date"
    t.boolean  "search_authorization",     default: false
    t.boolean  "representative_statement", default: false
    t.boolean  "has_driving_license",      default: false
    t.boolean  "publish_pictures",         default: true
    t.boolean  "annual_survey",            default: false
    t.datetime "subscribed_at"
    t.integer  "manager_id"
    t.integer  "info_source_id"
    t.text     "other_academic_info"
    t.integer  "profession_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "volunteers", ["academic_level_id"], name: "index_volunteers_on_academic_level_id", using: :btree
  add_index "volunteers", ["address_id"], name: "index_volunteers_on_address_id", using: :btree
  add_index "volunteers", ["employment_status_id"], name: "index_volunteers_on_employment_status_id", using: :btree
  add_index "volunteers", ["id_number_type_id"], name: "index_volunteers_on_id_number_type_id", using: :btree
  add_index "volunteers", ["info_source_id"], name: "index_volunteers_on_info_source_id", using: :btree
  add_index "volunteers", ["manager_id"], name: "index_volunteers_on_manager_id", using: :btree
  add_index "volunteers", ["nationality_id"], name: "index_volunteers_on_nationality_id", using: :btree
  add_index "volunteers", ["profession_id"], name: "index_volunteers_on_profession_id", using: :btree
  add_index "volunteers", ["status_id"], name: "index_volunteers_on_status_id", using: :btree
  add_index "volunteers", ["unsubscribe_reason_id"], name: "index_volunteers_on_unsubscribe_reason_id", using: :btree

  add_foreign_key "activities", "areas"
  add_foreign_key "activities", "entities"
  add_foreign_key "activities", "projects"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "provinces"
  add_foreign_key "addresses", "road_types"
  add_foreign_key "boroughs", "districts"
  add_foreign_key "documents", "projects"
  add_foreign_key "ent_trackings", "entities"
  add_foreign_key "ent_trackings", "managers"
  add_foreign_key "ent_trackings", "tracking_types"
  add_foreign_key "entities", "addresses"
  add_foreign_key "entities", "entity_types"
  add_foreign_key "entities", "request_reasons"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "event_types"
  add_foreign_key "pro_issues", "projects"
  add_foreign_key "pro_trackings", "projects"
  add_foreign_key "projects", "entities"
  add_foreign_key "projects", "project_types"
  add_foreign_key "pt_subventions", "proposals"
  add_foreign_key "record_histories", "users"
  add_foreign_key "request_forms", "rejection_types"
  add_foreign_key "request_forms", "request_reasons"
  add_foreign_key "request_forms", "request_types"
  add_foreign_key "request_forms", "users"
  add_foreign_key "rt_activity_publishings", "districts"
  add_foreign_key "rt_activity_publishings", "projects"
  add_foreign_key "rt_activity_publishings", "provinces"
  add_foreign_key "rt_activity_publishings", "road_types"
  add_foreign_key "rt_entity_subscribes", "districts"
  add_foreign_key "rt_entity_subscribes", "entity_types"
  add_foreign_key "rt_entity_subscribes", "provinces"
  add_foreign_key "rt_entity_subscribes", "road_types"
  add_foreign_key "rt_project_publishings", "districts"
  add_foreign_key "rt_project_publishings", "provinces"
  add_foreign_key "rt_project_publishings", "road_types"
  add_foreign_key "rt_project_unsubscribes", "projects"
  add_foreign_key "rt_volunteer_amendments", "districts"
  add_foreign_key "rt_volunteer_amendments", "provinces"
  add_foreign_key "rt_volunteer_amendments", "road_types"
  add_foreign_key "rt_volunteer_subscribes", "academic_levels"
  add_foreign_key "rt_volunteer_subscribes", "districts"
  add_foreign_key "rt_volunteer_subscribes", "employment_statuses"
  add_foreign_key "rt_volunteer_subscribes", "id_number_types"
  add_foreign_key "rt_volunteer_subscribes", "info_sources"
  add_foreign_key "rt_volunteer_subscribes", "nationalities"
  add_foreign_key "rt_volunteer_subscribes", "professions"
  add_foreign_key "rt_volunteer_subscribes", "provinces"
  add_foreign_key "rt_volunteer_subscribes", "road_types"
  add_foreign_key "rt_volunteer_subscribes", "statuses"
  add_foreign_key "rt_volunteers_demands", "districts"
  add_foreign_key "rt_volunteers_demands", "provinces"
  add_foreign_key "rt_volunteers_demands", "road_types"
  add_foreign_key "timetables", "events"
  add_foreign_key "users", "notice_types"
  add_foreign_key "volun_assessments", "projects"
  add_foreign_key "volun_assessments", "traits"
  add_foreign_key "volun_assessments", "volunteers"
  add_foreign_key "volun_availabilities", "volunteers"
  add_foreign_key "volun_contacts", "contact_results"
  add_foreign_key "volun_contacts", "contact_types"
  add_foreign_key "volun_contacts", "managers"
  add_foreign_key "volun_contacts", "projects"
  add_foreign_key "volun_contacts", "volunteers"
  add_foreign_key "volun_known_languages", "language_levels"
  add_foreign_key "volun_known_languages", "languages"
  add_foreign_key "volun_known_languages", "volunteers"
  add_foreign_key "volun_trackings", "managers"
  add_foreign_key "volun_trackings", "projects"
  add_foreign_key "volun_trackings", "tracking_types"
  add_foreign_key "volun_trackings", "volunteers"
  add_foreign_key "volunteers", "academic_levels"
  add_foreign_key "volunteers", "addresses"
  add_foreign_key "volunteers", "employment_statuses"
  add_foreign_key "volunteers", "id_number_types"
  add_foreign_key "volunteers", "info_sources"
  add_foreign_key "volunteers", "managers"
  add_foreign_key "volunteers", "nationalities"
  add_foreign_key "volunteers", "professions"
  add_foreign_key "volunteers", "statuses"
  add_foreign_key "volunteers", "unsubscribe_reasons"
end
