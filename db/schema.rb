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

ActiveRecord::Schema.define(version: 2018_11_02_174639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manifest_classes", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_damage_types", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.string "description"
    t.string "icon"
    t.string "icontrans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_genders", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_inv_buckets", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_inventoryitems", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.string "description"
    t.string "icon"
    t.string "screenshot"
    t.string "itemTypeDisplayName"
    t.string "itemTypeAndTierDisplayName"
    t.string "tierTypeHash"
    t.string "recoveryBucketTypeHash"
    t.string "isInstanceItem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_item_tier_types", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_perks", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.string "description"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_races", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifest_stats", force: :cascade do |t|
    t.string "hashVal"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "manifest_inventoryitem_id"
    t.string "hashVal"
    t.string "value"
    t.string "min"
    t.string "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "displayName"
    t.string "membershipId"
    t.string "charId1"
    t.string "charId2"
    t.string "charId3"
    t.string "membershipType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
