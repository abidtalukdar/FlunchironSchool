Rails.application.routes.draw do
  post '/search', to: 'restaurants#search', as: "search"
  
  # This next line stops it from breaking if they refresh the page after searching
  get '/search', to: 'restaurants#index'
  resources :reviews, only: [:create, :destroy]
  resources :restaurants, only: [:index, :show]
  resources :users, only: [:new, :create]
  get '/login', to: "auth#new", as: 'login'
  post '/login', to: "auth#create", as: 'authenticate'
  delete '/login', to: "auth#logout", as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
