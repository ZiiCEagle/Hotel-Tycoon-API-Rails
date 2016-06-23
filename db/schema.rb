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

ActiveRecord::Schema.define(version: 20160623081327) do

  create_table "bedroom_types", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bedrooms", force: :cascade do |t|
    t.integer  "number"
    t.integer  "beds"
    t.integer  "bedroomType_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bedroomType_id"], name: "index_bedrooms_on_bedroomType_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "Bedroom_id"
    t.integer  "Customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["Bedroom_id"], name: "index_reservations_on_Bedroom_id"
    t.index ["Customer_id"], name: "index_reservations_on_Customer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_activated",                    default: true
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
  end

end
