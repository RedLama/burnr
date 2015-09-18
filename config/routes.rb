Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :newsletters, only: :create

  get "10-principles", to: "pages#show", defaults: { id: "10-principles"}

  namespace :admin do
    resources :newsletters, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
    resources :slideshows, only: [:index, :create, :destroy]
  end
end
