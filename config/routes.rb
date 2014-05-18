Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants
	  get '/search', to: 'restaurants#search'
	  post '/favorite/:id', to: 'restaurants#favorite'
	  post '/unfavorite/:id', to: 'restaurants#unfavorite'
  
  resources :users, except: [:index]
  resource :session, only: [:create,:destroy]
  get '/make_request', to: 'foursquare#make_request'
end
