Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#new'
  resources :users
  resources :attractions, only: [:index, :show]
  resources :rides, only: [:new, :create]
  # root 'users#new'
  # post '/' => 'users#create'
  # get '/users/new' => 'users#new'
  # get '/users/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
