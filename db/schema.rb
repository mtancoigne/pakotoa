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

ActiveRecord::Schema.define(version: 20130916094435) do

  create_table "affiliations", force: true do |t|
    t.integer  "user_id"
    t.integer  "authority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affiliations", ["authority_id"], name: "index_affiliations_on_authority_id"
  add_index "affiliations", ["user_id"], name: "index_affiliations_on_user_id"

  create_table "authorities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "committed",  default: false
  end

  create_table "certificates", force: true do |t|
    t.string   "serial"
    t.integer  "authority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "certificates", ["authority_id"], name: "index_certificates_on_authority_id"

  create_table "oids", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "oid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_attributes", force: true do |t|
    t.integer  "oid_id"
    t.integer  "authority_id"
    t.string   "default"
    t.integer  "min"
    t.integer  "max"
    t.string   "policy"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_attributes", ["authority_id"], name: "index_subject_attributes_on_authority_id"
  add_index "subject_attributes", ["oid_id"], name: "index_subject_attributes_on_oid_id"

  create_table "users", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
