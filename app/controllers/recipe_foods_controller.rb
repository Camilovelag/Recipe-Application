class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.where(params[:id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    @recipe_food.save
    redirect_to recipe_recipe_foods_path(params[:recipe_id])
  end
end
