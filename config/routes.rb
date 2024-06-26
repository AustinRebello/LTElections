Rails.application.routes.draw do
  get 'races/index'
  get 'races/predictions'
  get 'admin/index'
  get 'admin/super'
  post 'admin/toggle_admin'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :news
  resources :miscs

  resources :presidents do
    collection do
      post :add_all_races
    end
  end

  resources :governors do
    collection do
      post :add_bulk_races
    end
  end

  resources :senates do
    collection do
      post :add_bulk_races
    end
  end

  resources :houses do
    collection do
      post :add_all_races
      get :state_races
    end
  end
  
  get 'test/index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"


end
