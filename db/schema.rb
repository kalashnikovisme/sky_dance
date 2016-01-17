# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131104210546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.text     "describe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "genres", force: :cascade do |t|
    t.text   "description"
    t.text   "photo"
    t.string "title"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "once_price"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "genre_id"
    t.integer  "teacher_id"
    t.string   "space"
    t.integer  "category_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.time     "time"
    t.string   "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.date     "published_at"
    t.text     "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "office_maps", force: :cascade do |t|
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.text     "photo"
    t.integer  "attachable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
  end

  add_index "photos", ["attachable_id"], name: "index_photos_on_attachable_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.text     "description"
    t.string   "motto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "unlimits", force: :cascade do |t|
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
  end

  create_table "videos", force: :cascade do |t|
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "genre_id"
  end

end
