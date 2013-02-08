Studyworx3::Application.routes.draw do

  get "team_messages/index"

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
      collection do
        get 'showmod'
        post 'sort'
      end 
      resources :tasks do
        collection do
          post 'sort'
        end
      end
    end
    get "tools/index"
    post "tools/book"
  end
  
  
  # ----------
  # :section: Normal Routes
  # Non Administrative routes below: 
  # ----------
  
  resources :messages do
    member do
      get 'reply', 'cancel_message', 'cancel_reply'
      put 'read'
      post 'save_reply'       
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
  resources :reviews
  resources :papers
  resources :schools do
    member do
      get 'set_current','homeroom'
    end
    resources :participants
    resources :assignments do
      resources :tasks
    end
  end
  resources :blogs
  resources :profiles do
    member do
      get 'reviewboard', 'reminder_load', 'public_load', 'public_show', 'reminder_show'
      post 'reviewboard_update', 'settheme', 'reminder_save', 'public_save'
      put 'bio_save'
    end
  end
  devise_for :users
  resources :home
  match 'shared/cancel' => 'shared#cancel', :as => :cancel

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
