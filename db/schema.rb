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

ActiveRecord::Schema.define(version: 20140522125137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: true do |t|
    t.integer  "user_id"
    t.integer  "certificate_authority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affiliations", ["certificate_authority_id"], name: "index_affiliations_on_certificate_authority_id", using: :btree
  add_index "affiliations", ["user_id"], name: "index_affiliations_on_user_id", using: :btree

  create_table "certificates", force: true do |t|
    t.string   "serial"
    t.integer  "issuer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",        default: "Certificate"
    t.string   "subject"
    t.text     "certificate"
    t.datetime "not_before"
    t.datetime "not_after"
    t.text     "key"
    t.decimal  "next_serial"
    t.integer  "policy_id"
    t.string   "export_root"
    t.datetime "revoked_at"
    t.string   "certify_for", default: "2 years from now"
  end

  add_index "certificates", ["issuer_id"], name: "index_certificates_on_issuer_id", using: :btree

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "oids", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "oid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_description"
  end

  create_table "policies", force: true do |t|
    t.string "name"
  end

  create_table "subject_attributes", force: true do |t|
    t.integer  "oid_id"
    t.integer  "policy_id"
    t.string   "default"
    t.integer  "min"
    t.integer  "max"
    t.string   "strategy"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "subject_attributes", ["oid_id"], name: "index_subject_attributes_on_oid_id", using: :btree
  add_index "subject_attributes", ["policy_id"], name: "index_subject_attributes_on_policy_id", using: :btree

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
    t.string   "time_zone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
