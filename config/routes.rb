Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  get "logout", to: "sessions#destroy"

  root 'users#dashboard'

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  post "login", to: "sessions#create"
  get "login", to: "sessions#new"

  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token



  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
end
