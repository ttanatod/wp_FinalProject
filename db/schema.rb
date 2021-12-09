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

ActiveRecord::Schema.define(version: 2021_12_09_095327) do

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.string "column"
    t.string "row"
    t.integer "price"
    t.integer "theater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "typeofchair"
    t.index ["theater_id"], name: "index_chairs_on_theater_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "date_in"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date_out"
  end

  create_table "orderlines", force: :cascade do |t|
    t.integer "Product_id", null: false
    t.integer "order_id", null: false
    t.integer "totalPrice"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Product_id"], name: "index_orderlines_on_Product_id"
    t.index ["order_id"], name: "index_orderlines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "row"
    t.integer "column"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "timetable_id", null: false
    t.integer "Chair_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Chair_id"], name: "index_tickets_on_Chair_id"
    t.index ["timetable_id"], name: "index_tickets_on_timetable_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.time "time_start"
    t.time "time_stop"
    t.integer "movie_id", null: false
    t.integer "theater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_timetables_on_movie_id"
    t.index ["theater_id"], name: "index_timetables_on_theater_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chairs", "theaters"
  add_foreign_key "inventories", "products"
  add_foreign_key "inventories", "users"
  add_foreign_key "orderlines", "Products"
  add_foreign_key "orderlines", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "tickets", "Chairs"
  add_foreign_key "tickets", "timetables"
  add_foreign_key "timetables", "movies"
  add_foreign_key "timetables", "theaters"
end
