require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :orders, expect: [:destroy]

  mount Sidekiq::Web => 'admin/sidekiq'
end
