Rails.application.routes.draw do
  

  namespace :rt do
    resources :others
    resources :activity_unpublishings, param: :activity_id
    resources :activity_publishings
    resources :project_unsubscribes, param: :project_id
    resources :project_unpublishings
    resources :project_publishings
    resources :volunteers_demands
    resources :entity_unsubscribes
    resources :entity_subscribes
    resources :volunteer_appointments
    resources :volunteer_amendments
    resources :volunteer_unsubscribes
    resources :volunteer_subscribes
  end
  
  resources :activities, only: [:show, :index, :index_i] do
    collection do
      get :index_i, param: :day
      get :boroughs
      get :search
    end
  end

  resources :entities, only:[:index,:show] do
    resources :projects, only:[:index, :show], param: :q
    resources :activities, only:[:index, :show], param: :q
  end

  resources :projects, only: [:show, :index, :index_i] do
    collection do
      get :index_i
      get :boroughs
    end
    resources :images
    resources :links
  end

  resources :volunteers

  #resources :entity_types
  #resources :project_types
  
  #resources :districts
  #resources :links
  #resources :images
  #resources :addresses
  #resources :address
  #resources :timetable
  #resources :volunteers
  #resources :districts_projects
  

  devise_for :users, controllers: {
                       sessions: 'users/sessions',
                       passwords: 'users/passwords'
                     }, :skip => [:registrations]                                          
  as :user do
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration', :defaults => { :format => 'html' }    
    put 'users' => 'users/registrations#update', :as => 'user_registration', :defaults => { :format => 'html' }                
  end

                    
  get 'welcome/index'

  get '/whoami' => 'pages#whoami'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
