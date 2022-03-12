Rails.application.routes.draw do
  root to: 'ecs#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :ecs, only: [:index]
  resources :users, only: %i[new create]
  resources :items, only: [:new, :edit, :destroy]

  namespace :admin do
    resources :users


  resources :carts, only: %i[create destroy] do
    resources :items, only: %i[create destroy update index], param: :item_id, controller: :cart_items
  end

end
