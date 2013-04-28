Studyworx3::Application.routes.draw do

  # ----------
  # :section: Admin Routes
  # This is a namespace for Admin functions
  # As I create other controllers in this namespace I can add resources and routes here.
  # rails g controller Admin::Controllername action action action etc.
  # ----------
  
  namespace :admin do
    resources :schools do
      resources :templats
      resources :scoresheets
      resources :observations
    end
    resources :profiles
    resources :user_admins
    resources :books do
      resources :paragraphs
    end
    resources :versions
    resources :assignments  do
      get 'show_help'
      collection do
        get 'showmod'
        post 'sort'
      end 
      resources :tasks do
        get 'show_help'
        collection do
          post 'sort'
        end
      end
    end
    
    # Reports
    get "reports" => 'reports#index', as: :reports
    
    resources :helps
    resources :duedates
      get "duedates/list" => "duedates#list", as: :duedates_list
     
    # Tools
    get "tools/index" => "tools#index", as: :tools
    post "tools/book" => "tools#book", as: :tools_book
    put "tools/update_participant/:id" => "tools#update_participant", as: :tools_update_participant
    get 'tools/edit_participant/:id' => "tools#edit_participant", as: :tools_edit_participant
    get "tools/personnel" => "tools#personnel", as: :tools_personnel
    get "tools/cancel_edit" => "tools#cancel_edit", as: :tools_cancel_edit
  end
  
  
  # ----------
  # :section: Normal Routes
  # Non Administrative routes below: 
  # ----------
  
  resources :messages do
    member do
      get 'cancel_message','cancel_message_edit'
      get 'reply', 'cancel_reply','reply_edit','cancel_reply_edit'
      put 'read','reply_update'
      post 'reply_create'       
    end
    collection do
      get 'get_read'
    end
  end
  resources :team_messages do
    member do
      get 'cancel_message','cancel_edit'
      get 'reply','reply_edit', 'cancel_reply', 'cancel_reply_edit' 
      post 'reply_create'
      put 'reply_update'
    end
    
  end
  resources :teams do
    member do
      get 'memberships'
      post 'add_member'
      delete 'remove_member'
    end
  end
  get 'teams/show_user/:id' => 'teams#show_user', as: :teams_show_user
  resources :reviews
  resources :papers
  resources :staffnotes
    # Staffnote parent views
    match 'document/:document_id/staffnote' => 'staffnotes#document', via: [:get], as: :document_staffnote
    match 'title/:title_id/staffnote' => 'staffnotes#title', via: [:get], as: :title_staffnote
    match 'ppoint/:ppoint_id/staffnote' => 'staffnotes#ppoint', via: [:get], as: :ppoint_staffnote
    match 'charttext/:charttext_id/staffnote' => 'staffnotes#charttext', via: [:get], as: :charttext_staffnote
    
  resources :schools do
    member do
      get 'set_current','homeroom'
    end
    resources :participants
    resources :assignments do
			get 'help','time_remaining'
      resources :tasks do
        resources :documents
      end
    end
    resources :grades
    match 'grades/:grade_id/coversheet' => 'grades#coversheet', via: [:get], as: :grade_coversheet
    match 'hand_in/assignment/:assignment_id' => 'grades#hand_in', via: [:post], as: :hand_in
    match 'collect' => 'grades#collect',via: [:get], as: :collect
    match 'collect_save' => 'grades#collect_save',via: [:post], as: :collect_save
    match 'load_team/students' => 'grades#load_team', via: [:get], as: :load_team 
    match 'load_module/assignments' => 'grades#load_module', via: [:get], as: :load_module
    match 'load/team/assignments' => 'schools#load_team_assignments', via: [:get], as: :load_team_assignments
    match 'grading_office' => 'grades#office', via: [:get], as: :grading_office
  end
  match 'user/:user_id/assignment/:assignment_id/load_tasks' => 'grades#load_tasks', via: [:get], as: :user_assignment_load_tasks
  match 'user/:user_id/task/:task_id/grading_view' => 'grades#grading_view', via: [:get], as: :user_task_grading_view
  match 'user/:user_id/task/:task_id/vertical/:vertical_id' => 'grades#grade_vertical', via: [:get], as: :user_task_grade_vertical
  match 'user/:user_id/grades' => 'grades#grades', via: [:get], as: :user_grades
  match 'grade/:grade_id/finish_grading' => 'grades#finish_grading', via: [:get], as: :grade_finish_grading
  
  # Routes for the Charts controller
  match 'task/:task_id/charts/start' => 'charts#start', via: [:get], as: :task_charts_start
  match 'task/:task_id/charting' => 'charts#charting', via: [:get], as: :task_charting
  match 'task/:task_id/charting/tools' => 'charts#tools', via: [:get], as: :task_charting_tools
  match 'task/:task_id/vertical/:vertical_id' => 'charts#vertical', via: [:get], as: :task_vertical
  match 'task/:task_id/print/charts' => 'charts#print', via: [:get], as: :task_print_charts
  match 'task/:task_id/download/charts' => 'charts#download', via: [:get], as: :task_download_charts
  match 'task/:task_id/title/:title_id/ppoint' => 'charts#new_ppoint', via: [:get], as: :task_title_ppoint_new
  match 'task/:task_id/ppoint/:ppoint_id' => 'charts#edit_ppoint', via: [:get], as: :task_ppoint
  match 'task/:task_id/ppoint/:ppoint_id' => 'charts#save_ppoint', via: [:put], as: :task_ppoint  
  match 'task/:task_id/ppoint/:ppoint_id/staffnote' => 'charts#ppoint_staffnote', via: [:get], as: :task_ppoint_staffnote
  match 'task/:task_id/ppoint/:ppoint_id' => 'charts#delete_ppoint', via: [:delete], as: :task_ppoint
  match 'task/:task_id/ppoint/:ppoint_id/cancel' => 'charts#cancel_ppoint', via: [:get], as: :task_ppoint_cancel
  match 'task/:task_id/title/:title_id/save' => 'charts#save', via: [:put], as: :task_title_save
  match 'task/:task_id/title/:title_id/new_title' => 'charts#new_title', via: [:get], as: :task_title_new_title
  match 'task/:task_id/title/:title_id/create_title' => 'charts#create_title', via: [:post], as: :task_title_create_title
  match 'task/:task_id/title/:title_id/staffnote' => 'charts#title_staffnote', via: [:get], as: :task_title_staffnote
  match 'task/:task_id/title/:title_id' => 'charts#delete_title', via: [:delete], as: :task_title_delete
  match 'task/:task_id/autopopulate' => 'charts#autopopulate', via: [:post], as: :task_titles_autopopulate
  match 'task/:task_id/destroy_all' => 'charts#destroy_all', via: [:delete], as: :task_titles_destroy_all
  match 'task/:task_id/charttext/:charttext_id' => 'charts#save_charttext', via: [:put], as: :task_charttext
  match 'task/:task_id/charttext/:charttext_id/staffnote' => 'charts#charttext_staffnote', via: [:get], as: :task_charttext_staffnote 
  
  # Routes for the images controller
  match 'task/:task_id/images' => 'images#index', via: [:get], as: :task_images
  match 'task/:task_id/download_horizontal' => 'images#download_horizontal', via: [:get], as: :task_download_horizontal
  match 'task/:task_id/download_vertical' => 'images#download_vertical', via: [:get], as: :task_download_vertical
  match 'task/:task_id/download_all_charts' => 'images#download_all_charts', via: [:get], as: :task_download_all_charts
  
  resources :documents do
    get 'endnote','task_instructions','assignment_instructions','fullscreen','normal','print','download','staffnote'
    put 'update_endnote','update_staffnote', 'toggle_type'
  end
  # Document sidebar viewer/editor routes
  match 'task/:task_id/documents/related' => 'documents#related_documents', via: [:get], as: :task_related_documents
  match 'documents/all/user' => 'documents#all_user', via: [:get], as: :all_user_documents
  match 'document/:document_id/sidebar' => 'documents#sidebar', via: [:get], as: :document_sidebar_view
  match 'document/:document_id/sidebar/edit' => 'documents#sidebar_edit', via: [:get], as: :document_sidebar_edit
  
  
  resources :blogs do
    post 'toggle_content_type'
  end
  
  resources :profiles do
    member do
      get 'reviewboard', 'reminder_load', 'public_load', 'public_show', 'reminder_show'
      post 'reviewboard_update', 'reminder_save', 'public_save','settheme'
      put 'bio_save'
    end
    get 'loadtheme','toggletheme'
  end
  
  devise_for :users
  resources :home
  match 'shared/cancel' => 'shared#cancel', :as => :cancel
  match 'shared/close_popup' => 'shared#close_popup', as: :close_popup
  match 'assignment/:assignment_id/time_remaining' => 'shared#time_remaining', as: :assignment_time_remaining
  match 'shared/close_lightbox' => 'shared#close_lightbox', as: :close_lightbox
  match 'shared/help/:id' => 'shared#help', as: :help
  match 'teams/show_user/:id' => 'teams#show_user', as: :show_user
  root :to => 'home#index'
  
  
end
