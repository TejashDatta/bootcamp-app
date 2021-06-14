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

ActiveRecord::Schema.define(version: 2021_05_13_145857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.references :user, null: false, foreign_key: true
    t.string "action", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index %i[user_id action], name: "index_permissions_on_user_action", unique: true
  end

  create_table "travelers" do |t|
    t.references "user", null: false, foreign_key: true
    t.string "name", null: false
    t.string "departure_country", null: false
    t.string "arrival_country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passports" do |t|
    t.references "traveler", null: false, index: { unique: true }, foreign_key: true
    t.string "passport_number"
    t.string "nationality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "investors" do |t|
    t.references "user", null: false, foreign_key: true
    t.string "account_number", null: false, index: { unique: true }
    t.integer "balance_in_yen", null: false, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_investments" do |t|
    t.references "investor", null: false, foreign_key: true
    t.string "stock_name", null: false
    t.float "shares_owned", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects" do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technologies" do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects_technologies", id: false do |t|
    t.references "project", null: false, foreign_key: true
    t.references "technology", null: false, foreign_key: true
  end

  create_table "employees" do |t|
    t.string "name", null: false
    t.date "date_of_joining", null: false
    t.string "department", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "citizens" do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unnormalized_site_visitors" do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.string "browser", null: false
    t.string "browser_developer", null: false
    t.string "browser_platforms", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "site_visitors" do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.references "browser", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "browsers" do |t|
    t.string "name", null: false
    t.string "developer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms" do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "browser_compatibilities" do |t|
    t.references "browser"
    t.references "platform"
  end
end
