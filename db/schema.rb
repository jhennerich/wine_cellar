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

ActiveRecord::Schema.define(version: 2022_03_24_211704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "winecellars", force: :cascade do |t|
    t.string "name"
    t.boolean "full"
    t.string "location"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.string "varietal"
    t.integer "quantity"
    t.boolean "in_stock"
    t.date "year"
    t.integer "wine_score"
    t.bigint "winecellar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["winecellar_id"], name: "index_wines_on_winecellar_id"
  end

  add_foreign_key "wines", "winecellars"
end
