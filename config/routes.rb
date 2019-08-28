Rails.application.routes.draw do

    root 'application#home'
    resources :users do
      resources :rides
    end
    resources :attractions
    resources :rides, only: [:create]

    get '/signin' => 'sessions#sign_in'
    post '/signin' => 'sessions#create'
    get '/signout' => 'sessions#destroy'
end
