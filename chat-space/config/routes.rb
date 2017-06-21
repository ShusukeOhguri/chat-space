Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :groups, only: [:new, :create, :edit, :update]
  root  'groups#index'
end
