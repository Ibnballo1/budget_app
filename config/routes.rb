Rails.application.routes.draw do
  get 'home_pages/home'
  # devise_for :users
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]

  resources :users, only: [:index]
  resources :groups do
    resources :entities
  end
  # Defines the root path route ("/")
  get 'index', to: 'users#index'
  root "users#index"
end
