Rails.application.routes.draw do
  root to: "home#index"
  resources :attractions, only: [:index, :show]
  resources :cities, only: [:index, :show]
  resources :countries, only: [:index, :show]
  resources :hotels, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Add this line to your config/routes.rb
  get 'about', to: 'pages#about', as: 'about'
end
