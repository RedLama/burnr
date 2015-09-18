Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :newsletters, only: :create

  get "10-principles", to: "pages#show", as: "principles", defaults: { id: "10-principles"}
  get "french-burners", to: "pages#show", as: "frenchburners", defaults: { id: "frenchburners"}
  get "burning-man", to: "pages#show", as: "burningman", defaults: { id: "burningman" }

  namespace :admin do
    resources :newsletters, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
    resources :slideshows, only: [:index, :create, :destroy]
  end
end
