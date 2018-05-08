Rails.application.routes.draw do
  resources :searches
  resources :users

  get '/login', to: 'session#new' 
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  get '/callback/', to: 'session#spotify_session'
end
