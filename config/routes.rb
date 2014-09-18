Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants
	  get 'api/restaurants/search', to: 'restaurants#search'
    get 'api/restaurants/:id', to: 'restaurants#show'
    get 'api/restaurants/', to: 'restaurants#fetch'
	  post '/favorite/:id', to: 'restaurants#favorite'
	  post '/unfavorite/:id', to: 'restaurants#unfavorite'
  
  resources :users, except: [:index]
  resource :session, only: [:create,:destroy]
end
