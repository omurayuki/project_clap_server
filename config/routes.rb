Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :teams
  post '/users/login', to: 'users#login'
end