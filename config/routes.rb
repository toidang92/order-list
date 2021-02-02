require 'sidekiq/web'

Sidekiq::Web.set :session_secret, Rails.application.secret_key_base

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :orders, only: [:index, :show, :edit, :update]
  resources :products, only: [:index, :show]
  resources :users, only: [:index]

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
