Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update] do
    collection do
      get 'search'
    end
  end
  resources :groups, only: [:new, :create, :edit, :show, :update] do
    resources :messages do
      collection do
        get 'index_update'
      end
    end
  end
  root  'groups#index'
end
