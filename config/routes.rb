Rails.application.routes.draw do

  root 'welcome#home'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:create, :index, :new, :show, :edit, :update]
  resources :rides

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end