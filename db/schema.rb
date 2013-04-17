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

ActiveRecord::Schema.define(:version => 20130416171340) do

  create_table "assignments", :force => true do |t|
    t.integer  "school_id"
    t.integer  "book_id"
    t.integer  "scoresheet_id"
    t.integer  "position"
    t.string   "name"
    t.integer  "weight"
    t.integer  "module"
    t.text     "resources"
    t.text     "instructions"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "assignments", ["school_id", "module", "position"], :name => "index_assignments_on_school_id_and_module_and_position"

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "topic"
    t.text     "excerpt"
    t.text     "article"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.boolean  "featured"
    t.boolean  "leadstory"
    t.boolean  "navbar"
    t.integer  "content_type", :default => 0
  end

  create_table "books", :force => true do |t|
    t.string   "short_name"
    t.string   "name"
    t.integer  "verse_count"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  add_index "books", ["position"], :name => "index_books_on_position"

  create_table "charttexts", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "title_id",                    :null => false
    t.text     "content"
    t.text     "staff_note"
    t.integer  "content_type", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "charttexts", ["user_id", "title_id"], :name => "index_charttexts_on_user_id_and_title_id"

  create_table "colors", :force => true do |t|
    t.string   "color"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.integer  "assignment_id"
    t.integer  "task_id"
    t.text     "content",       :limit => 16777215
    t.integer  "content_type",                      :default => 0
    t.text     "staff_note"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "documents", ["school_id", "assignment_id", "task_id"], :name => "index_documents_on_school_id_and_assignment_id_and_task_id"
  add_index "documents", ["user_id"], :name => "index_documents_on_user_id"

  create_table "duedates", :force => true do |t|
    t.integer  "school_id"
    t.integer  "team_id"
    t.integer  "assignment_id"
    t.datetime "duedate"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "duedates", ["assignment_id"], :name => "index_duedates_on_assignment_id"
  add_index "duedates", ["duedate"], :name => "index_duedates_on_duedate"
  add_index "duedates", ["school_id", "team_id"], :name => "index_duedates_on_school_id_and_team_id"

  create_table "endnotes", :force => true do |t|
    t.integer  "document_id"
    t.integer  "paper_id"
    t.text     "content",      :limit => 16777215
    t.integer  "content_type",                     :default => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "endnotes", ["document_id"], :name => "index_endnotes_on_document_id"
  add_index "endnotes", ["paper_id"], :name => "index_endnotes_on_paper_id"

  create_table "grades", :force => true do |t|
    t.integer  "school_id",                           :null => false
    t.integer  "assignment_id",                       :null => false
    t.integer  "user_id",                             :null => false
    t.integer  "staff_id"
    t.boolean  "viewable",         :default => false
    t.boolean  "done",             :default => false
    t.integer  "grade"
    t.boolean  "returned",         :default => false
    t.text     "staff_comments"
    t.text     "student_comments"
    t.text     "scratchpad"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "grades", ["done"], :name => "index_grades_on_done"
  add_index "grades", ["school_id", "assignment_id", "user_id"], :name => "index_grades_on_school_id_and_assignment_id_and_user_id"
  add_index "grades", ["staff_id"], :name => "index_grades_on_staff_id"
  add_index "grades", ["user_id"], :name => "index_grades_on_user_id"

  create_table "helps", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "content_type", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
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
    t.boolean  "sender_read",    :default => false
    t.boolean  "recipient_read", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "team_id"
  end

  add_index "messages", ["parent_id"], :name => "index_messages_on_parent_id"
  add_index "messages", ["recipient_id", "recipient_read"], :name => "index_messages_on_recipient_id_and_recipient_read"
  add_index "messages", ["recipient_id", "team_id"], :name => "index_messages_on_recipient_id_and_team_id"
  add_index "messages", ["school_id"], :name => "index_messages_on_school_id"
  add_index "messages", ["sender_id", "sender_read"], :name => "index_messages_on_sender_id_and_sender_read"

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.text     "reminder"
    t.text     "public"
    t.text     "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "observations", :force => true do |t|
    t.integer  "school_id",                     :null => false
    t.integer  "position",   :default => 0,     :null => false
    t.string   "code"
    t.string   "name"
    t.boolean  "public",     :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "observations", ["school_id"], :name => "index_observations_on_school_id"

  create_table "papers", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "synopsis"
    t.text     "body",       :limit => 16777215
    t.boolean  "published"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "paragraphs", :force => true do |t|
    t.integer  "book_id"
    t.string   "content",     :limit => 50, :null => false
    t.integer  "position",                  :null => false
    t.string   "startref",    :limit => 20, :null => false
    t.string   "endref",      :limit => 20, :null => false
    t.integer  "verse_count",               :null => false
    t.integer  "version_id",                :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "paragraphs", ["book_id"], :name => "bookId"
  add_index "paragraphs", ["version_id", "book_id", "position"], :name => "index_paragraphs_on_version_id_and_book_id_and_position"
  add_index "paragraphs", ["version_id"], :name => "version_id"

  create_table "participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id",     :default => 10
    t.integer  "school_id"
    t.integer  "language_id"
    t.boolean  "prereq",      :default => false
    t.integer  "accepted",    :default => 0,     :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "participants", ["school_id", "role_id"], :name => "index_participants_on_school_id_and_role_id"
  add_index "participants", ["school_id"], :name => "index_participants_on_school_id"
  add_index "participants", ["user_id"], :name => "index_participants_on_user_id"

  create_table "ppoints", :force => true do |t|
    t.integer  "title_id",                            :null => false
    t.integer  "user_id",                             :null => false
    t.integer  "observation_id"
    t.integer  "position",                            :null => false
    t.text     "content"
    t.string   "color",          :default => "black", :null => false
    t.text     "staff_note"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "ppoints", ["position"], :name => "index_ppoints_on_position"
  add_index "ppoints", ["user_id", "title_id"], :name => "index_ppoints_on_user_id_and_title_id"

  create_table "preferences", :force => true do |t|
    t.integer  "user_id"
    t.string   "theme",      :limit => 100, :default => "base"
    t.string   "bgcolor",                   :default => "white"
    t.integer  "rows",                      :default => 20
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.boolean  "wallpaper",                 :default => false
  end

  add_index "preferences", ["user_id"], :name => "index_preferences_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "paper_id"
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "approved",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "reviews", ["paper_id"], :name => "index_reviews_on_paper_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

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
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "owner_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "header_file_name"
    t.string   "header_content_type"
    t.integer  "header_file_size"
    t.datetime "header_updated_at"
    t.string   "featured_file_name"
    t.string   "featured_content_type"
    t.integer  "featured_file_size"
    t.datetime "featured_updated_at"
    t.string   "caption"
    t.string   "color"
  end

  create_table "scoresheets", :force => true do |t|
    t.integer  "school_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "content_type", :default => 0
  end

  add_index "scoresheets", ["school_id"], :name => "index_scoresheets_on_school_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "staffnotes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.integer  "noteable_id"
    t.string   "noteable_type", :limit => 20
    t.text     "content"
    t.integer  "content_type",                :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "staffnotes", ["noteable_id", "noteable_type"], :name => "index_staffnotes_on_noteable_id_and_noteable_type"
  add_index "staffnotes", ["user_id", "assignment_id"], :name => "index_staffnotes_on_user_id_and_assignment_id"

  create_table "states", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "uptodate",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "states", ["user_id"], :name => "index_states_on_user_id"

  create_table "tasks", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "templat_id"
    t.string   "name"
    t.float    "percent"
    t.text     "help"
    t.integer  "task_type"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tasks", ["assignment_id", "position"], :name => "index_tasks_on_assignment_id_and_position"
  add_index "tasks", ["assignment_id", "task_type"], :name => "index_tasks_on_assignment_id_and_task_type"

  create_table "teams", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "school_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "coreteam",    :default => false, :null => false
  end

  add_index "teams", ["coreteam"], :name => "index_teams_on_coreteam"
  add_index "teams", ["owner_id"], :name => "index_teams_on_owner_id"
  add_index "teams", ["school_id"], :name => "index_teams_on_school_id"

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  add_index "teams_users", ["user_id", "team_id"], :name => "index_teams_users_on_user_id_and_team_id"

  create_table "templats", :force => true do |t|
    t.integer  "school_id"
    t.string   "name"
    t.text     "content"
    t.boolean  "public"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "content_type", :default => 0
  end

  add_index "templats", ["school_id", "name"], :name => "index_templats_on_school_id_and_name"

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.boolean  "wallpaper",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "themes", ["filename"], :name => "index_themes_on_filename", :unique => true

  create_table "title_hierarchies", :id => false, :force => true do |t|
    t.integer "ancestor_id",   :null => false
    t.integer "descendant_id", :null => false
    t.integer "generations",   :null => false
  end

  add_index "title_hierarchies", ["ancestor_id", "descendant_id"], :name => "index_title_hierarchies_on_ancestor_id_and_descendant_id", :unique => true
  add_index "title_hierarchies", ["descendant_id"], :name => "index_title_hierarchies_on_descendant_id"

  create_table "titles", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "user_id",       :null => false
    t.integer  "school_id",     :null => false
    t.integer  "assignment_id", :null => false
    t.integer  "task_id",       :null => false
    t.integer  "paragraph_id"
    t.integer  "title_type",    :null => false
    t.integer  "position",      :null => false
    t.integer  "segnum"
    t.string   "title"
    t.integer  "verse_count"
    t.text     "staff_note"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "titles", ["assignment_id"], :name => "index_titles_on_assignment_id"
  add_index "titles", ["parent_id"], :name => "index_titles_on_parent_id"
  add_index "titles", ["school_id"], :name => "index_titles_on_school_id"
  add_index "titles", ["task_id"], :name => "index_titles_on_task_id"
  add_index "titles", ["user_id", "task_id", "position"], :name => "index_titles_on_user_id_and_task_id_and_position"

  create_table "turnins", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.integer  "assignment_id",                    :null => false
    t.integer  "staff_id"
    t.text     "comment"
    t.boolean  "viewable",      :default => false
    t.boolean  "done",          :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "turnins", ["done"], :name => "index_turnins_on_done"
  add_index "turnins", ["staff_id"], :name => "index_turnins_on_staff_id"
  add_index "turnins", ["user_id", "assignment_id"], :name => "index_turnins_on_user_id_and_assignment_id"
  add_index "turnins", ["viewable"], :name => "index_turnins_on_viewable"

  create_table "user_admins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "level",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "firstname",              :limit => 100
    t.string   "lastname",               :limit => 100
    t.string   "phone"
    t.text     "address"
    t.boolean  "reviewboard"
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
    t.integer  "school",                                :default => 0
    t.integer  "role"
    t.string   "timezone"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["lastname"], :name => "index_users_on_lastname"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
