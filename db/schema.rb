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


ActiveRecord::Schema.define(version: 20141124010908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.integer  "vote_count"
  end

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "article_id"
    t.integer  "commenter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "consoles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "title"
    t.integer  "genre_id"
    t.integer  "console_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.integer "discussable_id"
    t.string  "discussable_type"
    t.integer "article_id"
  end

  create_table "users", force: true do |t|
    t.string   "handle"
    t.string   "email"
    t.string   "password_digest"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voter_id"
  end

end
