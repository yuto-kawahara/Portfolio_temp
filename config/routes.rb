Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:new, :index, :show, :create, :destroy]
  resources :recruits, only: [:new, :create, :index, :show, :destroy] do
    resource :reservations, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
  resources :tags do
    get 'games', to: 'games#search'
  end
end
