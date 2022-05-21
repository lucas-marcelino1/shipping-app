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

ActiveRecord::Schema[7.0].define(version: 2022_05_21_175434) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carrier_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_carrier_users_on_carrier_id"
    t.index ["email"], name: "index_carrier_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_carrier_users_on_reset_password_token", unique: true
  end

  create_table "carriers", force: :cascade do |t|
    t.string "corporation_name"
    t.string "brand_name"
    t.string "registration_number"
    t.string "email_domain"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deadlines", force: :cascade do |t|
    t.integer "initial_distance"
    t.integer "final_distance"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id", null: false
    t.index ["carrier_id"], name: "index_deadlines_on_carrier_id"
  end

  create_table "prices", force: :cascade do |t|
    t.float "initial_volume"
    t.float "final_volume"
    t.float "initial_weight"
    t.float "final_weight"
    t.float "price_per_km"
    t.float "minimal_price"
    t.float "minimal_distance"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_prices_on_carrier_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.integer "carrier_id", null: false
    t.integer "vehicle_id"
    t.string "pickup_address"
    t.string "delivery_address"
    t.string "item_code"
    t.string "recipient_name"
    t.string "recipient_CPF"
    t.float "volume"
    t.float "weight"
    t.string "order_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_service_orders_on_carrier_id"
    t.index ["vehicle_id"], name: "index_service_orders_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.integer "maximum_charge"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_vehicles_on_carrier_id"
  end

  add_foreign_key "deadlines", "carriers"
  add_foreign_key "prices", "carriers"
  add_foreign_key "service_orders", "carriers"
  add_foreign_key "service_orders", "vehicles"
  add_foreign_key "vehicles", "carriers"
end
