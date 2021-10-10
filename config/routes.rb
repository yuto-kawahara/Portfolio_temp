Rails.application.routes.draw do
  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:new, :index, :show, :create, :destroy, :edit, :update]
  resources :recruits, only: [:new, :create, :index, :show, :destroy] do
    resource :reservations, only: [:create, :destroy]
  end
  resources :products, only: [:index, :show]
  # resources :users, only: [:show, :edit, :update, :index]
  get 'mypage' => 'users#mypage'
  patch 'mypage/profile_edit' => 'users#update'
  get 'mypage/profile_edit' => 'users#profile_edit'

  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end


  resources :staffs, only: [:edit, :update, :index]
  namespace :staffs do
    resources :products
  end

  resources :tags, only: [:create, :destroy] do
    get 'games', to: 'games#search'
  end
  get 'games/add', to: 'games#add'
end
