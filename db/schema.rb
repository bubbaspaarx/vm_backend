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

ActiveRecord::Schema.define(version: 2019_01_03_081859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "machine_cashes", force: :cascade do |t|
    t.string "quantity"
    t.bigint "machine_id"
    t.bigint "money_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_cashes_on_machine_id"
    t.index ["money_id"], name: "index_machine_cashes_on_money_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "money", force: :cascade do |t|
    t.string "denomination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value"
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "snack_id"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_receipts_on_sale_id"
    t.index ["snack_id"], name: "index_receipts_on_snack_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "machine_id"
    t.index ["machine_id"], name: "index_sales_on_machine_id"
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "machine_id"
    t.bigint "snack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_stocks_on_machine_id"
    t.index ["snack_id"], name: "index_stocks_on_snack_id"
  end

  add_foreign_key "machine_cashes", "machines"
  add_foreign_key "machine_cashes", "money"
  add_foreign_key "receipts", "sales"
  add_foreign_key "receipts", "snacks"
  add_foreign_key "sales", "machines"
  add_foreign_key "stocks", "machines"
  add_foreign_key "stocks", "snacks"
end
