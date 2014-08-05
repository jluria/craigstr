Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :regions
  resources :categories
  resource :dashboard, only: [:show]

  root "homes#show"

end
