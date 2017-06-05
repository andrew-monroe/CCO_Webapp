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

ActiveRecord::Schema.define(version: 20170605205402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "galaxy_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.integer "galaxy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agency_coordinations", force: :cascade do |t|
    t.integer "coordinator_id"
    t.integer "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "galaxy_id"
    t.index ["email"], name: "index_coordinators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coordinators_on_reset_password_token", unique: true
  end

  create_table "needs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agency"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "location"
    t.integer "volunteers_needed"
    t.integer "volunteers_signed_up"
    t.integer "agency_id"
    t.integer "galaxy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "status"
    t.string "referenceId"
    t.string "middleName"
    t.string "mobile"
    t.string "phone"
    t.string "company"
    t.string "gender"
    t.string "birthdate"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "postal"
    t.string "dateAdded"
    t.string "dateUpdated"
    t.string "dateLastLogin"
    t.string "link"
    t.string "expires"
    t.string "now"
    t.string "disasterContact"
  end

end
