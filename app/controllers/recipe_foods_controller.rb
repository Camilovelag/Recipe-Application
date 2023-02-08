class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.where(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.food_id = 21
    @recipe_food.recipe_id = 24
    if @recipe_food.save
      redirect_to recipe_recipe_foods_path(params[:recipe_id])
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    @recipe_food.save
    redirect_to recipe_recipe_foods_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
