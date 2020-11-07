Rails.application.routes.draw do
devise_for :users
root "items#index"
resources :items, only: [:new, :create, :show, :destroy] do
  resources :comments, only: [:create, :destroy]
end
resources :category, only: [:show,:index]
resources :users, only: [:show] do
  resources :profiles, only: [:create, :destroy, :show, :new]
  end
end
