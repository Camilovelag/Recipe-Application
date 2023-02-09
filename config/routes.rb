Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index]

  resources :inventories, only: [:index, :show, :destroy] do
    resources :inventory_foods, only: [:index, :create, :destroy]
  end

  resources :foods, only: [:index]
end
