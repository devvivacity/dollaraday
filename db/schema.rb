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

ActiveRecord::Schema.define(version: 20150730031818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "donation_nonprofits", force: true do |t|
    t.integer  "donation_id"
    t.integer  "nonprofit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "donation_on"
  end

  add_index "donation_nonprofits", ["donation_id", "nonprofit_id"], name: "index_donation_nonprofits_on_donation_id_and_nonprofit_id", using: :btree
  add_index "donation_nonprofits", ["nonprofit_id", "donation_id"], name: "index_donation_nonprofits_on_nonprofit_id_and_donation_id", using: :btree

  create_table "donations", force: true do |t|
    t.integer  "donor_id"
    t.decimal  "amount",           precision: 8, scale: 2, default: 0.0
    t.string   "guid"
    t.datetime "scheduled_at"
    t.datetime "executed_at"
    t.string   "nfg_charge_id"
    t.string   "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cancelled_at"
    t.decimal  "added_fee",        precision: 8, scale: 2, default: 0.0
    t.integer  "donor_card_id"
    t.datetime "failed_at"
    t.string   "last_failure"
    t.string   "stripe_charge_id"
    t.decimal  "total_minus_fee",  precision: 8, scale: 2
    t.decimal  "total",            precision: 8, scale: 2
    t.datetime "disputed_at"
    t.datetime "refunded_at"
  end

  create_table "donor_cards", force: true do |t|
    t.integer  "donor_id"
    t.string   "nfg_cof_id"
    t.boolean  "is_active"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "ip_address"
    t.string   "stripe_card_id"
  end

  create_table "donors", force: true do |t|
    t.string   "nfg_donor_token"
    t.date     "started_on"
    t.date     "finished_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.boolean  "is_anonymous",       default: false
    t.boolean  "add_fee",            default: false
    t.string   "public_name"
    t.datetime "cancelled_at"
    t.integer  "subscriber_id"
    t.datetime "uncancelled_at"
    t.datetime "failed_at"
    t.integer  "gift_id"
    t.string   "stripe_customer_id"
  end

  create_table "emails", force: true do |t|
    t.integer  "newsletter_id"
    t.integer  "subscriber_id"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mailer"
    t.string   "mailer_method"
    t.string   "to"
  end

  create_table "favorites", force: true do |t|
    t.integer  "subscriber_id"
    t.integer  "nonprofit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifts", force: true do |t|
    t.string   "giver_email"
    t.string   "message"
    t.integer  "months_remaining"
    t.date     "start_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "giver_name"
    t.string   "recipient_email"
    t.string   "recipient_name"
    t.boolean  "converted_to_recipient",    default: false
    t.date     "finish_on"
    t.integer  "original_months_remaining"
    t.integer  "giver_subscriber_id"
  end

  create_table "metrics", force: true do |t|
    t.string   "key"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", force: true do |t|
    t.integer  "nonprofit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "donor_generated"
    t.text     "subscriber_generated"
    t.datetime "donors_sent_at"
    t.datetime "subscribers_sent_at"
  end

  create_table "nonprofits", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "featured_on"
    t.string   "ein"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "website_url"
    t.string   "slug"
    t.string   "blurb"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "is_public",          default: false
    t.string   "twitter"
    t.string   "nfg_name"
  end

  add_index "nonprofits", ["ein"], name: "index_nonprofits_on_ein", using: :btree
  add_index "nonprofits", ["slug"], name: "index_nonprofits_on_slug", using: :btree

  create_table "payouts", force: true do |t|
    t.integer  "nonprofit_id"
    t.integer  "user_id"
    t.decimal  "amount",       precision: 8, scale: 2
    t.datetime "payout_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "guid"
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "ip_address"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "city"
    t.string   "region"
    t.string   "country"
  end

  add_index "subscribers", ["auth_token"], name: "index_subscribers_on_auth_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "is_admin"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
