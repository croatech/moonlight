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

ActiveRecord::Schema.define(version: 20160623075438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bots", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "hp"
    t.string   "inventory",          default: [],              array: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "level"
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "equipment_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "attack",             default: 0
    t.integer  "defense",            default: 0
    t.integer  "hp",                 default: 0
    t.integer  "level",              default: 1
    t.integer  "cost"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "equipment_items", ["category_id"], name: "index_equipment_items_on_category_id", using: :btree

  create_table "fights", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "bot_id"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "winner_type"
  end

  add_index "fights", ["bot_id"], name: "index_fights_on_bot_id", using: :btree
  add_index "fights", ["player_id"], name: "index_fights_on_player_id", using: :btree

  create_table "location_bots", force: :cascade do |t|
    t.integer "location_id"
    t.integer "bot_id"
  end

  add_index "location_bots", ["bot_id"], name: "index_location_bots_on_bot_id", using: :btree
  add_index "location_bots", ["location_id"], name: "index_location_bots_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "slug"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.boolean  "cell",                    default: false
  end

  add_index "locations", ["parent_id"], name: "index_locations_on_parent_id", using: :btree
  add_index "locations", ["slug"], name: "index_locations_on_slug", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "head"
    t.integer  "chest"
    t.integer  "shoulders"
    t.integer  "hands"
    t.integer  "legs"
    t.integer  "weapon"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.integer  "gold",               default: 300
    t.integer  "attack",             default: 1
    t.integer  "defense",            default: 1
    t.integer  "hp",                 default: 20
    t.integer  "level",              default: 1
    t.integer  "exp",                default: 0
    t.integer  "exp_next",           default: 100
    t.string   "inventory",          default: [],               array: true
    t.integer  "free_stats",         default: 10
    t.integer  "shield"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "players", ["location_id"], name: "index_players_on_location_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "fight_id"
    t.integer  "player_damage"
    t.integer  "bot_damage"
    t.integer  "status",        default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "player_hp"
    t.integer  "bot_hp"
  end

  add_index "rounds", ["fight_id"], name: "index_rounds_on_fight_id", using: :btree

  create_table "tool_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "fights", "players"
  add_foreign_key "players", "locations"
  add_foreign_key "rounds", "fights"
end
