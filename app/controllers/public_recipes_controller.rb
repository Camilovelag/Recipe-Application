class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true)
  end
end
