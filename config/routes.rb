require 'sidekiq/web'
require 'sidekiq/cron/web'
require 'sidekiq-statistic'
require 'sidekiq-failures'

Rails.application.routes.draw do
  root 'cv#show'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  get '/s/:id' => "shortener/shortened_urls#show"
  get 'contact', to: 'contract#show'
  get 'about', to: 'statics#about'

  scope module: :spina do
    # Pages
    get '/blog' => 'pages#homepage', as: :blog
    get '/post/:locale/*id' => 'pages#show', constraints: { locale: /#{Spina.config.locales.join('|')}/ }
    get '/blog/:locale/' => 'pages#homepage', constraints: { locale: /#{Spina.config.locales.join('|')}/ }
    get '/post/*id' => 'pages#show', as: :page
  end

  mount Sidekiq::Web => 'admin/sidekiq'
  mount Spina::Engine => '/'
end
