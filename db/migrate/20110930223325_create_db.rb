class CreateDb < ActiveRecord::Migration
  def up
    create_table "announcements", :force => true do |t|
      t.integer  "participant_id"
      t.integer  "school_id"
      t.string   "category"
      t.boolean  "leadstory"
      t.string   "topic"
      t.text     "msg",            :limit => 16777215
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "answers", :force => true do |t|
      t.integer  "participant_id"
      t.integer  "assignment_id"
      t.integer  "task_id"
      t.text     "body",           :limit => 16777215
      t.text     "staffnote"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    add_index "answers", ["assignment_id"], :name => "assignment_id"
    add_index "answers", ["participant_id"], :name => "participant_id"
    add_index "answers", ["task_id"], :name => "task_id"
  
    create_table "assignments", :force => true do |t|
      t.integer  "school_id",     :limit => 8
      t.integer  "book_id",       :limit => 8
      t.integer  "scoresheet_id"
      t.integer  "order"
      t.string   "name"
      t.integer  "weight",        :limit => 8
      t.integer  "quarter",       :limit => 8
      t.text     "resources"
      t.text     "instructions"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "due"
    end
  
    add_index "assignments", ["book_id"], :name => "assignmentsBookId"
    add_index "assignments", ["school_id"], :name => "assignmentsSchoolId"
    add_index "assignments", ["scoresheet_id"], :name => "assignmentsScoresheetId"
  
    create_table "books", :force => true do |t|
      t.string   "short_name"
      t.string   "name"
      t.integer  "verse_count"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "charttexts", :force => true do |t|
      t.integer  "title_id"
      t.integer  "task_id"
      t.integer  "participant_id"
      t.integer  "editor"
      t.text     "content",        :limit => 16777215
      t.text     "staffnote"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    add_index "charttexts", ["participant_id"], :name => "charttextsParticipantId"
    add_index "charttexts", ["task_id", "participant_id"], :name => "main_index"
    add_index "charttexts", ["task_id"], :name => "charttextsTaskId"
    add_index "charttexts", ["title_id"], :name => "charttextsTitleId"
  
    create_table "comments", :force => true do |t|
      t.integer  "topic_id"
      t.integer  "parent_id"
      t.integer  "participant_id"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "comments_count", :default => 0, :null => false
    end
  
    create_table "grades", :force => true do |t|
      t.integer  "participant_id"
      t.integer  "assignment_id"
      t.integer  "staff_id"
      t.integer  "school_id"
      t.integer  "grade"
      t.text     "staff_comments"
      t.text     "student_comments"
      t.text     "scratchpad"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    add_index "grades", ["assignment_id"], :name => "gradesAssignmentId"
    add_index "grades", ["participant_id"], :name => "gradesParticipantId"
    add_index "grades", ["school_id"], :name => "gradesSchoolId"
    add_index "grades", ["staff_id"], :name => "gradesStaffId"
  
    create_table "helps", :force => true do |t|
      t.integer  "index_id"
      t.integer  "parent_id"
      t.integer  "school_id"
      t.integer  "helptopic_id"
      t.integer  "language_id"
      t.integer  "order"
      t.string   "topic"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "helptopics", :force => true do |t|
      t.string   "name"
      t.string   "location"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "languages", :force => true do |t|
      t.string   "code"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "msgs", :force => true do |t|
      t.integer  "parent_id"
      t.integer  "sender_id"
      t.integer  "recipient_id"
      t.integer  "school_id"
      t.boolean  "archived"
      t.boolean  "has_read"
      t.string   "subject"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    add_index "msgs", ["parent_id"], :name => "msgsParentId"
    add_index "msgs", ["recipient_id"], :name => "msgsRecipientId"
    add_index "msgs", ["school_id"], :name => "school_id"
    add_index "msgs", ["sender_id"], :name => "msgsSenderId"
  
    create_table "observations", :force => true do |t|
      t.string   "link"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "color"
      t.string   "code"
      t.integer  "school_id"
      t.integer  "order"
    end
  
    create_table "paragraphs", :force => true do |t|
      t.integer "book_id"
      t.string  "content",     :limit => 50, :null => false
      t.integer "p_order",                   :null => false
      t.string  "startref",    :limit => 20, :null => false
      t.string  "endref",      :limit => 20, :null => false
      t.integer "verse_count",               :null => false
      t.integer "version_id",                :null => false
    end
  
    add_index "paragraphs", ["book_id", "p_order", "version_id"], :name => "book_id"
    add_index "paragraphs", ["book_id"], :name => "bookId"
    add_index "paragraphs", ["version_id"], :name => "version_id"
  
    create_table "participants", :force => true do |t|
      t.integer  "user_id",         :limit => 8, :null => false
      t.integer  "role_id",         :limit => 8
      t.integer  "school_id",       :limit => 8
      t.integer  "registration_id", :limit => 8
      t.integer  "accepted"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "editor"
      t.string   "theme"
      t.integer  "language_id"
    end
  
    add_index "participants", ["registration_id"], :name => "participantsRegistrationId"
    add_index "participants", ["role_id"], :name => "participantsRoleId"
    add_index "participants", ["school_id"], :name => "school_id"
    add_index "participants", ["user_id"], :name => "participantsUserId"
  
    create_table "plugin_schema_info", :id => false, :force => true do |t|
      t.string  "plugin_name"
      t.integer "version"
    end
  
    create_table "ppoints", :force => true do |t|
      t.integer  "title_id"
      t.integer  "task_id"
      t.integer  "participant_id"
      t.integer  "position"
      t.string   "content"
      t.text     "staffnote"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "observation_id"
      t.string   "color"
    end
  
    add_index "ppoints", ["observation_id"], :name => "ppointsObservationId"
    add_index "ppoints", ["participant_id"], :name => "ppointsParticipantId"
    add_index "ppoints", ["task_id", "participant_id"], :name => "main_index"
    add_index "ppoints", ["task_id"], :name => "ppointsTaskId"
    add_index "ppoints", ["title_id"], :name => "ppointsTitleId"
  
    create_table "registrations", :force => true do |t|
      t.integer  "school_id",       :limit => 8
      t.integer  "user_id",         :limit => 8
      t.boolean  "prereq"
      t.text     "comment"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "fname"
      t.string   "lname"
      t.text     "mailing_address"
      t.string   "phone"
      t.string   "skype"
    end
  
    add_index "registrations", ["school_id"], :name => "registrationSchoolId"
    add_index "registrations", ["user_id"], :name => "registrationsUserId"
  
    create_table "roles", :force => true do |t|
      t.string   "rolename"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "schools", :force => true do |t|
      t.string   "name"
      t.text     "location"
      t.text     "prereqs"
      t.text     "tagline"
      t.text     "description"
      t.date     "start_date"
      t.date     "end_date"
      t.boolean  "enrolement_type", :default => true
      t.boolean  "active",          :default => true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "timezone"
      t.integer  "version_id"
      t.integer  "language_id"
    end
  
    create_table "scoresheets", :force => true do |t|
      t.integer  "school_id"
      t.integer  "participant_id"
      t.string   "name"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "coversheet"
    end
  
    add_index "scoresheets", ["school_id"], :name => "school_id"
  
    create_table "states", :force => true do |t|
      t.integer  "participant_id"
      t.integer  "task_id"
      t.boolean  "current"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "msg"
    end
  
    create_table "tasks", :force => true do |t|
      t.integer  "assignment_id"
      t.integer  "templat_id"
      t.integer  "task_type"
      t.string   "name"
      t.float    "percent"
      t.text     "help"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "task_order"
    end
  
    add_index "tasks", ["assignment_id"], :name => "tasksAssignmentId"
    add_index "tasks", ["task_order"], :name => "tasksTaskOrder"
    add_index "tasks", ["templat_id"], :name => "tasksTemplatId"
  
    create_table "teams", :force => true do |t|
      t.integer  "parent_id"
      t.integer  "user_id"
      t.integer  "school_id"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "teams_count"
    end
  
    create_table "templats", :force => true do |t|
      t.integer  "school_id"
      t.string   "name"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    add_index "templats", ["school_id"], :name => "school_id"
  
    create_table "titles", :force => true do |t|
      t.integer  "parent_id"
      t.integer  "participant_id"
      t.integer  "paragraph_id"
      t.integer  "assignment_id"
      t.integer  "task_id"
      t.string   "title"
      t.integer  "title_type"
      t.integer  "title_order"
      t.integer  "verse_count"
      t.text     "staffnote"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
  
    add_index "titles", ["assignment_id"], :name => "titlesAssignmentId"
    add_index "titles", ["paragraph_id"], :name => "titlesparagraphId"
    add_index "titles", ["parent_id"], :name => "titlesParentId"
    add_index "titles", ["participant_id", "task_id"], :name => "titlesPaticipantTask"
    add_index "titles", ["task_id"], :name => "task_id"
    add_index "titles", ["title_order"], :name => "title_order"
    add_index "titles", ["title_type"], :name => "title_type"
  
    create_table "topics", :force => true do |t|
      t.integer  "task_id"
      t.string   "title"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "order",         :default => 0, :null => false
      t.integer  "assignment_id"
    end
  
    create_table "turnins", :force => true do |t|
      t.integer  "assignment_id"
      t.integer  "participant_id"
      t.integer  "staff_id"
      t.boolean  "done",           :default => false
      t.text     "comment"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "users", :force => true do |t|
      t.string   "login"
      t.string   "email"
      t.string   "crypted_password",          :limit => 40
      t.string   "salt",                      :limit => 40
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "remember_token"
      t.datetime "remember_token_expires_at"
      t.string   "activation_code",           :limit => 40
      t.datetime "activated_at"
      t.string   "password_reset_code",       :limit => 40
      t.boolean  "enabled",                                 :default => true
    end
  
    create_table "versions", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def down
  end
end
