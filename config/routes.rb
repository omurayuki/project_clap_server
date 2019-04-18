Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  post '/users/login', to: 'users#login'
end