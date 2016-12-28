Rails.application.routes.draw do
  resources :rt_volunteer_unsubscribes
  resources :addresses
  resources :rt_volunteer_amendments
  resources :rt_entity_subscribes
  resources :rt_volunteer_subscribes
  resources :activities
  resources :volunteers
  resources :districts_projects
  resources :districts
  resources :links
  resources :images
  resources :entities
  resources :address
  resources :timetable
  resources :projects, only: [:index, :show] do
    member do
      get :image
      put :link
    end
    
  end
  resources :entity_types
  resources :project_types
  devise_for :users, controllers: {
                       sessions: 'users/sessions',
                       passwords: 'users/passwords',
                       
                     }

  devise_scope :user do
       #get 'users/sign_up/success', to: 'users/registrations#success'
       get 'users/passwords/updateC', to: 'users/passwords#updateC'
  end                   
  get 'welcome/index'



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
