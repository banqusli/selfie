Rails.application.routes.draw do
  resources :pictures do
    member do
      put 'like', to: 'pictures#upvote'
    end
  end
  get 'index', to: 'dashboard#index'
  root 'dashboard#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
