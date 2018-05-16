Rails.application.routes.draw do

  root 'home#top'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/reviews', to: 'reviews#create'

  # get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
  # get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure

  resources :posts
  resources :messages
  resources :users
end
