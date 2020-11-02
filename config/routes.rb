Rails.application.routes.draw do
devise_for :users
root "items#index"
resources :items, only: [:new, :create, :show]
resources :category, only: [:show,:index]
resources :users, only: [:show]
end
