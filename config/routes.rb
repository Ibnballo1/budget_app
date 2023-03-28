Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :entities
  end
  # Defines the root path route ("/")
  root "users#index"
end
