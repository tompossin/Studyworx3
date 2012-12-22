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

ActiveRecord::Schema.define(:version => 20121221235545) do

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "topic"
    t.text     "excerpt"
    t.text     "article"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "featured"
    t.boolean  "leadstory"
    t.boolean  "navbar"
  end

  create_table "message_hierarchies", :id => false, :force => true do |t|
    t.integer "ancestor_id",   :null => false
    t.integer "descendant_id", :null => false
    t.integer "generations",   :null => false
  end

  add_index "message_hierarchies", ["ancestor_id", "descendant_id"], :name => "index_message_hierarchies_on_ancestor_id_and_descendant_id", :unique => true
  add_index "message_hierarchies", ["descendant_id"], :name => "index_message_hierarchies_on_descendant_id"

  create_table "messages", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "school_id"
    t.boolean  "sender_read"
    t.boolean  "recipient_read"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "team_id"
  end

  add_index "messages", ["recipient_id", "recipient_read"], :name => "index_messages_on_recipient_id_and_recipient_read"
  add_index "messages", ["recipient_id", "team_id"], :name => "index_messages_on_recipient_id_and_team_id"
  add_index "messages", ["sender_id", "sender_read"], :name => "index_messages_on_sender_id_and_sender_read"

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.text     "reminder"
    t.text     "public"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "bio"
  end

  create_table "papers", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "synopsis"
    t.text     "body",       :limit => 16777215
    t.boolean  "published"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "school_id"
    t.integer  "language_id"
    t.boolean  "prereq"
    t.integer  "accepted"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "participants", ["school_id"], :name => "index_participants_on_school_id"
  add_index "participants", ["user_id"], :name => "index_participants_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "paper_id"
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "approved",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.integer  "version_id"
    t.integer  "language_id"
    t.string   "name"
    t.string   "location"
    t.text     "prereqs"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "mailing_address"
    t.text     "tagline"
    t.text     "description"
    t.boolean  "enrolement_type"
    t.boolean  "active"
    t.string   "timezone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "owner_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "teams", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "school_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  add_index "teams_users", ["user_id", "team_id"], :name => "index_teams_users_on_user_id_and_team_id"

  create_table "user_admins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "firstname"
    t.text     "lastname"
    t.string   "phone"
    t.text     "address"
    t.boolean  "reviewboard"
    t.integer  "theme"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "wallpaper_file_name"
    t.string   "wallpaper_content_type"
    t.integer  "wallpaper_file_size"
    t.datetime "wallpaper_updated_at"
    t.string   "iotd_file_name"
    t.string   "iotd_content_type"
    t.integer  "iotd_file_size"
    t.datetime "iotd_updated_at"
    t.integer  "school",                 :default => 0
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
