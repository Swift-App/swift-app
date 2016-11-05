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

ActiveRecord::Schema.define(version: 20161105110745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_news_articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "attendence_reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "report_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "job_name"
    t.index ["job_id"], name: "index_attendence_reports_on_job_id", using: :btree
    t.index ["user_id"], name: "index_attendence_reports_on_user_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "completion_reports", force: :cascade do |t|
    t.integer "user_id"
    t.integer "job_id"
    t.string  "photo"
    t.text    "comments"
    t.string  "job_name"
    t.integer "breaktime"
    t.boolean "tardy_or_leave", default: false, null: false
    t.time    "start_time"
    t.time    "end_time"
    t.index ["job_id"], name: "index_completion_reports_on_job_id", using: :btree
    t.index ["user_id"], name: "index_completion_reports_on_user_id", using: :btree
  end

  create_table "confirmations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_confirmations_on_job_id", using: :btree
    t.index ["user_id"], name: "index_confirmations_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "job_tags", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_tags_on_job_id", using: :btree
    t.index ["tag_id"], name: "index_job_tags_on_tag_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title",                         null: false
    t.text     "description",                   null: false
    t.text     "content"
    t.string   "location"
    t.string   "nearest_station"
    t.string   "number_of_positions"
    t.string   "work_date"
    t.string   "hours"
    t.string   "holidays"
    t.string   "certifications_and_experience"
    t.string   "benefits"
    t.string   "person_in_charge",              null: false
    t.text     "remarks"
    t.string   "pay_range"
    t.string   "area"
    t.string   "shift_category"
    t.string   "duration"
    t.string   "category"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "pay_amount"
    t.string   "photo"
    t.string   "job_type"
  end

  create_table "morrigan_editor_rails_editor_images", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title",            null: false
    t.text     "content",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "meta_description"
    t.string   "featured_photo"
  end

  create_table "payment_reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "request_date"
    t.date     "date_1"
    t.date     "date_2"
    t.date     "date_3"
    t.date     "date_4"
    t.date     "date_5"
    t.date     "comments"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_payment_reservations_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.date    "date_1"
    t.date    "date_2"
    t.date    "date_3"
    t.date    "date_4"
    t.date    "date_5"
    t.date    "date_6"
    t.date    "date_7"
    t.text    "additional_notes"
    t.integer "user_id"
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
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
    t.string   "first_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "last_name"
    t.string   "first_name_katakana"
    t.string   "last_name_katakana"
    t.string   "phone"
    t.date     "birthday"
    t.string   "postal_code"
    t.string   "prefecture"
    t.string   "city"
    t.string   "address_details"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "confirmations", "jobs"
  add_foreign_key "confirmations", "users"
  add_foreign_key "job_tags", "jobs"
  add_foreign_key "job_tags", "tags"
  add_foreign_key "payment_reservations", "users"
end
