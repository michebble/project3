Rails.application.routes.draw do
  get '/searches/try_again', to: 'searches#try_again'
  resources :searches
  resources :users

  get '/','/login', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/room', to: 'rooms#show'
  get '/match/', to: 'searches#show_match'

  get '/callback/', to: 'session#spotify_callback'
  # get '/match/', to: 'searches#find_match'

  namespace :api do #points to api folder in controllers
    post '/search/', to: "searches#add_search"
    get '/match/', to:'searches#find_match'
    post '/messages/', to: 'rooms#create'
    get '/messages/', to: 'rooms#index'
  end

end
