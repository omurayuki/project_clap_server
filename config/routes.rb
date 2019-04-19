# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :teams
  resources :diaries do
    resources :comments do
      resources :replies
    end
  end
  # resources :comment, only: %i() do
  #   resources :replies
  # end

  post '/users/login', to: 'users#login'
  post '*unmatched_route', to: 'application#raise_not_found', format: false
  get '*unmatched_route', to: 'application#raise_not_found', format: false
end
