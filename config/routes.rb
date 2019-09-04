Rails.application.routes.draw do
  get 'welcome/home'
  root 'welcome#home'
  
  resources :users, only: [:new, :create, :show]
  get 'signup' => 'users#new'

  resources :sessions, only: [:new, :create]
  get 'signin' => 'sessions#new'
  delete 'session' => 'sessions#destroy', as: 'logout'

  resources :attractions, only: [:new, :create, :show, :index, :edit, :update] do
    resources :rides, only: [:create]
  end
end
