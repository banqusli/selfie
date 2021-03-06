Rails.application.routes.draw do
  resources :chats
  get 'chats/index', to: 'chats#index'
  mount ActionCable.server => '/cable'
  match 'chats', to: 'chats#index', via: :all
  resources :friends
  resources :notifications
  resources :pictures do
    member do
      put 'like', to: 'pictures#upvote'
    end
  end
  match 'friends', to: 'friends#index', via: :all
  get 'error', to: 'dashboard#error'
  get 'index', to: 'dashboard#index'
  get 'index/id', to: 'dashboard#index#id'
  root 'pictures#index'
  devise_for :users
  mount Commontator::Engine => '/commontator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
