Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get '/public_recipes', to: 'public_recipes#index'
  resources :foods, only: [:index, :new, :destroy, :create]
  resources :users, only: [:index]
  resources :shopping_lists, only: [:index]

  resources :inventories, only: [:index, :show, :destroy] do
    resources :inventory_foods, only: [:index, :create, :destroy]
  end


  resources :foods, only: [:index, :new, :destroy, :create]

  get 'recipes/:recipe_id/inventories/:inventory_id/shopping_list', to: 'shopping_lists#show', as: 'shopping_list'

  resources :recipes do
    resources :recipe_foods
  end
  
end
