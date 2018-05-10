Rails.application.routes.draw do
  resources :searches
  resources :users
   
  get '/','/login', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/room', to: 'rooms#show'

  get '/callback/', to: 'session#spotify_callback'
  get '/match/', to: 'searches#find_match'

  namespace :api do #points to api folder in controllers
    get '/api/match/' to:'api/searches#find_match'
  end

end
