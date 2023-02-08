Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index]

  resources :recipes
  
  resources :recipe_foods, only: [:index, :destroy]
  
  resources :inventories do
    resources :inventury_foods, only: [:index]
  end

  resources :foods, only: [:index]
end
