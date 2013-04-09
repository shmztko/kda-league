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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130408083544) do

  create_table "games", :force => true do |t|
    t.date     "scheduled_at"
    t.integer  "home_shop_id"
    t.integer  "away_shop_id"
    t.integer  "winning_type_id"
    t.integer  "home_score",      :default => 0
    t.integer  "away_score",      :default => 0
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "is_abstained",    :default => false
  end

  add_index "games", ["away_shop_id"], :name => "index_game_results_on_away_shop_id"
  add_index "games", ["home_shop_id"], :name => "index_game_results_on_home_shop_id"
  add_index "games", ["winning_type_id"], :name => "index_game_results_on_winning_type_id"

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "shop_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["shop_id"], :name => "index_players_on_shop_id"

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "winning_types", :force => true do |t|
    t.string   "kind"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "point"
  end

end
