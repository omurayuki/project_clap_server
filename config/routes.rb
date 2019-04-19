# frozen_string_literal: true

Rails.application.routes.draw do
  get '/diaries/all', to: 'diaries#find_all'
  post '/users/login', to: 'users#login'

  resources :users
  resources :teams
  resources :diaries do
    resources :comments do
      resources :replies
    end
  end
  post '*unmatched_route', to: 'application#raise_not_found', format: false
  get '*unmatched_route', to: 'application#raise_not_found', format: false
end