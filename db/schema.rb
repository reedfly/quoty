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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130309114431) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bookmarks", ["quote_id"], :name => "index_bookmarks_on_quote_id"
  add_index "bookmarks", ["user_id"], :name => "index_bookmarks_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["quote_id"], :name => "index_comments_on_quote_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "file"
    t.integer  "quote_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "providers", ["user_id"], :name => "index_identities_on_user_id"

  create_table "quotes", :force => true do |t|
    t.text     "content"
    t.string   "author"
    t.string   "source"
    t.string   "language"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.integer  "score",          :default => 0
    t.integer  "comments_count", :default => 0
    t.text     "context"
    t.integer  "source_wiki_id"
    t.integer  "author_wiki_id"
  end

  add_index "quotes", ["author_wiki_id"], :name => "index_quotes_on_author_wiki_id"
  add_index "quotes", ["source_wiki_id"], :name => "index_quotes_on_source_wiki_id"
  add_index "quotes", ["user_id"], :name => "index_quotes_on_user_id"

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.string   "locale"
    t.string   "languages"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_preferences", ["user_id"], :name => "index_user_preferences_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "slug"
    t.string   "email"
    t.text     "profile"
    t.string   "email_md5"
    t.datetime "omniauth_info_updated_at"
    t.boolean  "is_admin",                 :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wikis", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "ancestry"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "wikis", ["ancestry"], :name => "index_wikis_on_ancestry"

end
