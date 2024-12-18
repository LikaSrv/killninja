Rails.application.routes.draw do
  devise_for :users
  root to: "ninjas#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :ninjas do
    resources :reservations, only: [:new, :create, :show]
  end

  resources :users, only: [:show] do
    resources :reservations, only: [:index]
  end

  resources :reservations, only: [:index] do
    resources :reviews, only: [:new, :create, :show]
  end

end
