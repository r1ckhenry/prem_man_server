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

ActiveRecord::Schema.define(version: 20160508191232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brains", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "decisions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "brains", ["player_id"], name: "index_brains_on_player_id", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.integer  "founded"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "nation_id"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "description"
    t.integer  "league_id"
  end

  add_index "clubs", ["league_id"], name: "index_clubs_on_league_id", using: :btree
  add_index "clubs", ["nation_id"], name: "index_clubs_on_nation_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.integer  "nation_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "leagues", ["nation_id"], name: "index_leagues_on_nation_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "game_id"
    t.string   "first_name"
    t.string   "second_name"
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "managers", ["club_id"], name: "index_managers_on_club_id", using: :btree
  add_index "managers", ["game_id"], name: "index_managers_on_game_id", using: :btree

  create_table "nations", force: :cascade do |t|
    t.string   "name"
    t.string   "capital"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rating"
    t.integer  "club_id"
    t.integer  "nation_id"
  end

  add_index "players", ["club_id"], name: "index_players_on_club_id", using: :btree
  add_index "players", ["nation_id"], name: "index_players_on_nation_id", using: :btree

  create_table "technicals", force: :cascade do |t|
    t.integer  "passing"
    t.integer  "shooting"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "technicals", ["player_id"], name: "index_technicals_on_player_id", using: :btree

  add_foreign_key "brains", "players"
  add_foreign_key "clubs", "leagues"
  add_foreign_key "clubs", "nations"
  add_foreign_key "leagues", "nations"
  add_foreign_key "managers", "clubs"
  add_foreign_key "managers", "games"
  add_foreign_key "players", "nations"
  add_foreign_key "technicals", "players"
end
