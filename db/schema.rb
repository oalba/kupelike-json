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

ActiveRecord::Schema.define(version: 20170328101141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.date     "born_date"
    t.string   "gender"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.integer  "year"
    t.integer  "place_id"
    t.integer  "votes_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["place_id"], name: "index_items_on_place_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "description"
    t.string   "picture"
    t.string   "town"
    t.text     "time"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "name"
    t.string   "surnames"
    t.text     "address"
    t.string   "phone"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["place_id"], name: "index_users_on_place_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "item_id"
    t.bigint   "client_id"
    t.date     "date"
    t.boolean  "aviso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_votes_on_client_id", using: :btree
    t.index ["item_id"], name: "index_votes_on_item_id", using: :btree
  end

  add_foreign_key "items", "places"
  add_foreign_key "users", "places"
  add_foreign_key "users", "roles"
  add_foreign_key "votes", "clients"
  add_foreign_key "votes", "items"
end
