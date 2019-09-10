Rails.application.routes.draw do
  
  root 'users#new'
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:new, :create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end