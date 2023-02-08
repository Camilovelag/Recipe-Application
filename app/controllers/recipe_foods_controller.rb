class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.where(params[:id])
  end
end
