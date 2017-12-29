Rails.application.routes.draw do

  concern :downloadable do
    get 'download', on: :member
  end

  namespace :rt do
    resources :others, only:[:new,:create]
    resources :activity_unpublishings, only:[:new,:create], param: :activity_id
    resources :activity_publishings, only:[:new,:create]
    resources :project_unpublishings, only:[:new,:create], param: :project_id
    resources :project_publishings, only:[:new,:create], param: :project_id
    resources :volunteers_demands, only:[:new,:create], param: :project_id
    resources :entity_unsubscribes, only:[:new,:create]
    resources :volunteer_appointments, only:[:new,:create]
    resources :volunteer_amendments, only:[:new,:create]
    resources :volunteer_unsubscribes, only:[:new,:create], param: :project_id
    resources :volunteer_subscribes, only:[:new,:create,:index]
  end

  resources :addresses do
    get 'bdc_search_towns', on: :collection
    get 'bdc_search_roads', on: :collection
    get 'bdc_search_road_numbers', on: :collection
  end

  resources :activities, only: [:show, :index ] do
    collection do
      get :my_area
      get :boroughs
      get :search
    end
  end

  resources :entities, only:[:index,:show,:new,:create] do
    resources :projects, only:[:index, :show], param: :q
    resources :activities, only:[:index, :show], param: :q
  end

  resources :projects, only: [:show, :index] do
    collection do
      get :my_area
      get :boroughs
      get :search
    end
    resources :images
    resources :links
  end

  resources :links, concerns: :downloadable

  resources :volunteers do
    resources :projects, only:[:index], param: :q
  end


  devise_for :users, controllers: {
                       sessions: 'users/sessions',
                       passwords: 'users/passwords',
                       registrations: 'users/registrations'

                     }

  resources :users, only: [:show] do
    collection do
      get :search_activities
      get :search_projects
    end
  end

  get 'welcome/index'

  get '/whoami' => 'pages#whoami'
  get '/mailchimp' => 'pages#mailchimp'
  get '/conditions' => 'pages#conditions'
  get '/blog' => redirect("https://voluntariospormadridblog.madrid.es/")
  resources :pages, path: '/', only: [:show]

  root 'welcome#index'


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
