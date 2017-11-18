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

ActiveRecord::Schema.define(version: 20171118120926) do

  create_table "beers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.decimal "abv", precision: 10
    t.integer "ibu"
    t.text "notes"
    t.bigint "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subcategory_id"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
    t.index ["subcategory_id"], name: "index_beers_on_subcategory_id"
  end

  create_table "breweries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country_code", limit: 3
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "bjcp_number"
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bjcp_number"], name: "index_categories_on_bjcp_number"
  end

  create_table "subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "bjcp_number"
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bjcp_number"], name: "index_subcategories_on_bjcp_number"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "notes"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "beers", "breweries"
  add_foreign_key "beers", "subcategories"
  add_foreign_key "subcategories", "categories"
end
