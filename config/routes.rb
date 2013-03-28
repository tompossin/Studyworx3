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
    
    resources :helps
    get "duedates/list" => "duedates#list", as: :duedates_list
    resources :duedates 
    get "tools/index","tools/personnel", "tools/cancel_edit"
    post "tools/book"
    put "tools/update_participant/:id" => "tools#update_participant", as: :tools_update_participant
    get 'tools/edit_participant/:id' => "tools#edit_participant", as: :tools_edit_participant
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
  match 'user/:user_id/grades' => 'grades#grades', via: [:get], as: :user_grades
  match 'grade/:grade_id/finish_grading' => 'grades#finish_grading', via: [:get], as: :grade_finish_grading
  
  resources :documents do
    get 'endnote','task_instructions','assignment_instructions','fullscreen','normal','print','download'
    put 'update_endnote', 'toggle_type'
  end
  
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
  match 'teams/show_user/:id' => 'teams#show_user', as: :show_user
  match 'shared/help/:id' => 'shared#help', as: :help
   
  root :to => 'home#index'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
