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

ActiveRecord::Schema.define(version: 20180107120918) do

  create_table "inventories", force: :cascade do |t|
    t.integer "quantity"
    t.integer "resource_id"
    t.integer "survivor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_inventories_on_resource_id"
    t.index ["survivor_id"], name: "index_inventories_on_survivor_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "survivor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reporter"
    t.index ["survivor_id"], name: "index_reports_on_survivor_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "item"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.integer "latitude"
    t.integer "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "infected"
  end

end
