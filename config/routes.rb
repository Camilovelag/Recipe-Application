Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  get '/public_recipes', to: 'public_recipes#index'
  resources :foods, only: [:index, :new, :destroy, :create]
  resources :users, only: [:index]
  resources :shopping_lists, only: [:index]

  resources :inventories, only: [:index, :show, :destroy] do
    resources :inventory_foods, only: [:index, :create, :destroy]
  end
  resources :recipes do
    resources :recipe_foods
    resources :inventories, only: [:index, :show, :destroy] do
    end
  end
  post '/shopping_lists', to: 'shopping_lists#index'
  resources :foods, only: [:index, :new, :destroy, :create]
  resources :shopping_lists, only: [:index]
end
