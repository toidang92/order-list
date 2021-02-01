require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :orders, only: [:index, :show, :edit, :update]
  resources :products, only: [:index, :show]

  mount Sidekiq::Web => 'admin/sidekiq'
end
