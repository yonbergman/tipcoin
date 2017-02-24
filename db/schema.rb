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

ActiveRecord::Schema.define(version: 20170224105256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_user_actions", force: :cascade do |t|
    t.bigint "group_user_id"
    t.bigint "target_id"
    t.integer "change", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_user_id"], name: "index_group_user_actions_on_group_user_id"
    t.index ["target_id"], name: "index_group_user_actions_on_target_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.boolean "owner", default: false, null: false
    t.integer "balance", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "group_user_actions", "group_users"
  add_foreign_key "group_user_actions", "group_users", column: "target_id"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
end
