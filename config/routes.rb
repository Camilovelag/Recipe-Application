Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index]

  resources :recipes do
    resources :recipe_foods
  end
  
  resources :inventories do
    resources :inventury_foods, only: [:index]
  end

  resources :foods, only: [:index, :new, :destroy, :create]

  resources :shopping_lists, only: [:index]
end
