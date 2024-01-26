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

ActiveRecord::Schema[7.1].define(version: 2024_01_26_072624) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datasets", force: :cascade do |t|
    t.string "name"
    t.string "data_type"
    t.string "language"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompts", force: :cascade do |t|
    t.bigint "split_id", null: false
    t.integer "row_idx"
    t.text "content"
    t.string "truncated_cells"
    t.boolean "partial", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["split_id"], name: "index_prompts_on_split_id"
  end

  create_table "splits", force: :cascade do |t|
    t.string "name"
    t.bigint "dataset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_id"], name: "index_splits_on_dataset_id"
  end

  add_foreign_key "prompts", "splits"
  add_foreign_key "splits", "datasets"
end
