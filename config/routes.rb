Rails.application.routes.draw do
  resources :users do
    resources :entities
  end
  # Defines the root path route ("/")
  root "users#index"
end
