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

ActiveRecord::Schema.define(version: 20180529035007) do

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "major_no"
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "major_no"
    t.text     "content",    limit: 65535
    t.string   "image_url"
    t.integer  "order"
    t.integer  "course_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["course_id"], name: "index_lessons_on_course_id", using: :btree
  end

  create_table "usercourses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_usercourses_on_course_id", using: :btree
    t.index ["user_id", "course_id"], name: "index_usercourses_on_user_id_and_course_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_usercourses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "courses", "users"
  add_foreign_key "lessons", "courses"
  add_foreign_key "usercourses", "courses"
  add_foreign_key "usercourses", "users"
end
