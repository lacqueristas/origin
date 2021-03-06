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

ActiveRecord::Schema.define(version: 20170416184711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "email", null: false
    t.text "encrypted_password", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "brands", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", default: "", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", default: "", null: false
    t.uuid "brand_id", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_lines_on_brand_id"
  end

  create_table "photographs", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.jsonb "variations", default: {}, null: false
    t.uuid "account_id", null: false
    t.uuid "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_photographs_on_account_id"
    t.index ["created_at"], name: "index_photographs_on_created_at"
    t.index ["project_id"], name: "index_photographs_on_project_id"
    t.index ["updated_at"], name: "index_photographs_on_updated_at"
  end

  create_table "polishes", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", default: "", null: false
    t.uuid "brand_id", null: false
    t.uuid "line_id", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_polishes_on_brand_id"
    t.index ["line_id"], name: "index_polishes_on_line_id"
  end

  create_table "projects", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", default: "", null: false
    t.datetime "painted_at", null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_projects_on_account_id"
    t.index ["created_at"], name: "index_projects_on_created_at"
    t.index ["name"], name: "index_projects_on_name"
    t.index ["painted_at"], name: "index_projects_on_painted_at"
    t.index ["updated_at"], name: "index_projects_on_updated_at"
  end

  add_foreign_key "lines", "brands"
  add_foreign_key "photographs", "accounts"
  add_foreign_key "photographs", "projects"
  add_foreign_key "polishes", "brands"
  add_foreign_key "polishes", "lines"
  add_foreign_key "projects", "accounts"
end
