Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :posts, only: [:new, :create, :edit, :update]

  resources :regions

  resource :dashboard, only: [:show]

  root "homes#show"

end
