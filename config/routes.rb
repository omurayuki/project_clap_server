Rails.application.routes.draw do
  resources :users
  resources :teams

  post '/users/login', to: 'users#login'
  post '*unmatched_route', to: 'application#raise_not_found', format: false
  get '*unmatched_route', to: 'application#raise_not_found', format: false
end