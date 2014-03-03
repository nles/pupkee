Pupkee::Application.routes.draw do
  root :to => 'customers#index'

  resources :efforts do
    member do
      post 'mark_as_paid'
    end
  end

  resources :documentations

  devise_for :users
  resources :users, :only => [:show,:index]

  resources :customers

  resources :contacts

  resources :tasks do
    collection do
      get 'all'
      get 'user'
    end
  end

  resources :services
end
