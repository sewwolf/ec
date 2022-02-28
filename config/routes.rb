Rails.application.routes.draw do
  root to: 'ecs#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'session#destroy'

  resources :ecs, only: [:index]
  resources :users, only: [:new, :create]
end
