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

ActiveRecord::Schema.define(version: 201709232242333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
    t.string "image"
  end

  create_table "bots", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "attack"
    t.integer "defense"
    t.integer "hp"
    t.string "inventory", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.string "avatar"
  end

  create_table "equipment_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "type"
  end

  create_table "equipment_items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "hp", default: 0
    t.integer "required_level", default: 1
    t.integer "price"
    t.boolean "artifact", default: false
    t.bigint "equipment_category_id"
    t.string "image"
    t.index ["equipment_category_id"], name: "index_equipment_items_on_equipment_category_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_events_on_player_id"
  end

  create_table "fights", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.integer "bot_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "winner_type"
    t.integer "dropped_gold"
    t.integer "winner_id"
    t.integer "dropped_item_id"
    t.string "dropped_item_type"
    t.index ["bot_id"], name: "index_fights_on_bot_id"
    t.index ["dropped_item_id"], name: "index_fights_on_dropped_item_id"
    t.index ["dropped_item_type"], name: "index_fights_on_dropped_item_type"
    t.index ["player_id"], name: "index_fights_on_player_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
    t.index ["winner_type"], name: "index_fights_on_winner_type"
  end

  create_table "location_bots", id: :serial, force: :cascade do |t|
    t.integer "location_id"
    t.integer "bot_id"
    t.index ["bot_id"], name: "index_location_bots_on_bot_id"
    t.index ["location_id"], name: "index_location_bots_on_location_id"
  end

  create_table "location_locations", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "near_location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_locations_on_location_id"
    t.index ["near_location_id"], name: "index_location_locations_on_near_location_id"
  end

  create_table "location_resources", id: :serial, force: :cascade do |t|
    t.integer "location_id"
    t.integer "resource_id"
    t.index ["location_id"], name: "index_location_resources_on_location_id"
    t.index ["resource_id"], name: "index_location_resources_on_resource_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "cell", default: false
    t.boolean "inactive", default: false
    t.index ["parent_id"], name: "index_locations_on_parent_id"
    t.index ["slug"], name: "index_locations_on_slug"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.text "text", null: false
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_messages_on_player_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "path", null: false, array: true
    t.bigint "player_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_movements_on_player_id"
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "location_id", default: 1383
    t.integer "helmet_slot"
    t.integer "armor_slot"
    t.integer "mail_slot"
    t.integer "gloves_slot"
    t.integer "foots_slot"
    t.integer "bracers_slot"
    t.integer "belt_slot"
    t.integer "weapon_slot"
    t.integer "shield_slot"
    t.integer "ring_slot"
    t.integer "necklace_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "gold", default: 0
    t.integer "attack", default: 1
    t.integer "defense", default: 1
    t.integer "hp", default: 20
    t.integer "level", default: 1
    t.integer "exp", default: 0
    t.integer "exp_next", default: 100
    t.string "equipment", default: [], array: true
    t.integer "free_stats", default: 10
    t.integer "lumberjacking_skill", default: 0
    t.integer "fishing_skill", default: 0
    t.string "tools", default: [], array: true
    t.integer "lumberjacking_slot"
    t.integer "fishing_slot"
    t.integer "cloak_slot"
    t.integer "pants_slot"
    t.integer "current_hp"
    t.integer "avatar_id"
    t.index ["location_id"], name: "index_players_on_location_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "resources", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "item_id"
    t.integer "price"
    t.string "type"
    t.string "image"
    t.index ["item_id"], name: "index_resources_on_item_id"
  end

  create_table "rounds", id: :serial, force: :cascade do |t|
    t.integer "fight_id"
    t.integer "player_damage"
    t.integer "bot_damage"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_hp"
    t.integer "bot_hp"
    t.string "player_attack_point"
    t.string "player_defense_point"
    t.string "bot_attack_point"
    t.string "bot_defense_point"
    t.index ["fight_id"], name: "index_rounds_on_fight_id"
  end

  create_table "stuffs", force: :cascade do |t|
    t.string "stuffable_type", null: false
    t.bigint "stuffable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id", null: false
    t.index ["player_id"], name: "index_stuffs_on_player_id"
    t.index ["stuffable_type", "stuffable_id"], name: "index_stuffs_on_stuffable_type_and_stuffable_id"
  end

  create_table "tool_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tool_items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "required_skill"
    t.bigint "tool_category_id"
    t.string "image"
    t.index ["tool_category_id"], name: "index_tool_items_on_tool_category_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
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
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "players"
  add_foreign_key "fights", "players"
  add_foreign_key "location_resources", "locations"
  add_foreign_key "location_resources", "resources"
  add_foreign_key "messages", "players"
  add_foreign_key "movements", "players"
  add_foreign_key "players", "locations"
  add_foreign_key "rounds", "fights"
end
