Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :newsletters, only: :create

  namespace :admin do
    resources :newsletters, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
    resources :slideshows, only: [:index, :create, :destroy]
  end
end
