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

ActiveRecord::Schema.define(version: 20190113180610) do

  create_table "capers", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "cell_row"
    t.integer  "cell_column"
    t.boolean  "cell_state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "game_players", force: :cascade do |t|
    t.string   "player_name"
    t.string   "player_email"
    t.string   "player_alias"
    t.integer  "won"
    t.integer  "lost"
    t.integer  "drawn"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "game_desc"
    t.integer  "score"
    t.string   "winner"
    t.string   "loser"
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.string   "state"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
