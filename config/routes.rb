Rails.application.routes.draw do
  resources :notifications
  resources :pictures do
    member do
      put 'like', to: 'pictures#upvote'
    end
  end
  get 'error', to: 'dashboard#error'
  get 'index', to: 'dashboard#index'
  root 'dashboard#index'
  devise_for :users
  mount Commontator::Engine => '/commontator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
