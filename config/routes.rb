Rails.application.routes.draw do
  
  root "static#index"

  get '/signup' => 'users#new'
  post '/signup' => 'user#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  post '/ride' => 'rides#create'

  resources :rides
  resources :attractions
  resources :users

end