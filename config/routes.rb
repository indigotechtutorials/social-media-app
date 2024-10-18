Rails.application.routes.draw do
  resources :posts do
    scope module: :posts do
      resources :reactions, only: [:create]
      resources :comments, only: [:new, :create, :index]
    end
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  authenticated :user do
    root to: "feed#show", as: :authenticated_user_root
  end

  # Defines the root path route ("/")
  root "pages#home"
end
