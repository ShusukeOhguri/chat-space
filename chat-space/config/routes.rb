Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :groups, only: [:index, :edit, :update]
  root  'messages#index'
end
