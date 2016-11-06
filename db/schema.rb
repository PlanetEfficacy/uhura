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

ActiveRecord::Schema.define(version: 20161105172945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.boolean  "default",          default: true
    t.string   "phone_number"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id", using: :btree
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_enrollments_on_group_id", using: :btree
    t.index ["student_id"], name: "index_enrollments_on_student_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "status",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "guardians", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "language_code"
    t.boolean  "primary",         default: true
    t.integer  "relationship_id"
    t.integer  "status",          default: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["relationship_id"], name: "index_guardians_on_relationship_id", using: :btree
  end

  create_table "guardianships", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["guardian_id"], name: "index_guardianships_on_guardian_id", using: :btree
    t.index ["student_id"], name: "index_guardianships_on_student_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_messages_on_contact_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.string   "relationship"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "language_code"
    t.integer  "status",        default: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_students_on_school_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role",          default: 0
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "urls"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.boolean  "expires"
    t.string   "language_code", default: "en"
    t.integer  "status",        default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_users_on_school_id", using: :btree
  end

  add_foreign_key "enrollments", "groups"
  add_foreign_key "enrollments", "students"
  add_foreign_key "groups", "users"
  add_foreign_key "guardians", "relationships"
  add_foreign_key "guardianships", "guardians"
  add_foreign_key "guardianships", "students"
  add_foreign_key "messages", "contacts"
  add_foreign_key "messages", "users"
  add_foreign_key "students", "schools"
  add_foreign_key "users", "schools"
end
