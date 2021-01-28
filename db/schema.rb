# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_28_142700) do

  create_table "listings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "price"
    t.string "photo_src"
    t.text "description"
    t.date "avail_date_begin"
    t.date "avail_date_end"
    t.integer "avail_period"
    t.integer "bedroom_number"
    t.integer "bathroom_number"
    t.integer "guest_number"
    t.boolean "trade_mode"
    t.boolean "rent_mode"
    t.boolean "strict_mode"
    t.string "address"
    t.string "state"
    t.integer "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
