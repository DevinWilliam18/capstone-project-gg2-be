# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_18_080131) do
  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.integer "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "condition_type"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "food_name"
    t.integer "food_quantity"
    t.text "food_desc"
    t.integer "conditions_id", null: false
    t.integer "producers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conditions_id"], name: "index_foods_on_conditions_id"
    t.index ["producers_id"], name: "index_foods_on_producers_id"
  end

  create_table "garbage_producers", force: :cascade do |t|
    t.string "producer_name"
    t.string "producer_pass"
    t.string "email_producer"
    t.text "address"
    t.time "opening_time"
    t.time "closing_time"
    t.integer "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_garbage_producers_on_province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "province_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "org_name"
    t.string "org_email"
    t.string "org_phone"
    t.string "org_address"
    t.string "org_pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "provinces"
  add_foreign_key "foods", "conditions", column: "conditions_id"
  add_foreign_key "foods", "producers", column: "producers_id"
  add_foreign_key "garbage_producers", "provinces"
end
