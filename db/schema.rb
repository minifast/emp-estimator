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

ActiveRecord::Schema[7.0].define(version: 2023_04_27_181749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estimates", force: :cascade do |t|
    t.bigint "metal_id", null: false
    t.string "name", null: false
    t.binary "file", null: false
    t.decimal "length", null: false
    t.decimal "width", null: false
    t.decimal "height", null: false
    t.string "units", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metal_id"], name: "index_estimates_on_metal_id"
  end

  create_table "metals", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_metals_on_name", unique: true
  end

end
