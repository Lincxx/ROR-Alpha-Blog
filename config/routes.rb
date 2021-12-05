Rails.application.routes.draw do
  root "pages#index"
  get "about", to: "pages#about"
  resources :articles

  get "signup", to: "users#new"
  
  # post "users", to: "users#create"
  resources :users, expect: [:new]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

end
