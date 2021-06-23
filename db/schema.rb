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

ActiveRecord::Schema.define(version: 2021_06_20_240750) do

  create_table "generator_configs", force: :cascade do |t|
    t.boolean "track_different_eos"
    t.integer "generator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["generator_id"], name: "index_generator_configs_on_generator_id"
  end

  create_table "generators", force: :cascade do |t|
    t.text "model"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "config"
  end

  create_table "generators_tags", id: false, force: :cascade do |t|
    t.integer "generator_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "snippets", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "tokens"
  end

  create_table "snippets_tags", id: false, force: :cascade do |t|
    t.integer "snippet_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

end
