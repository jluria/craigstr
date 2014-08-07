require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :regions do
    resources :categories, only: [:show] do
      resources :posts, except: [:index]
    end
  end

  resources :categories, except: [:show]
  resource :dashboard, only: [:show]
end
