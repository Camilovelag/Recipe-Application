class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.where(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def new
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = @recipe.id
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

  def food_params
    params.require(:recipe_food).permit(:food)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
