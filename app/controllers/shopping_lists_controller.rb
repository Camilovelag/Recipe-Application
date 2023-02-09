class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    @recipe_foods = @recipe.recipe_foods
    @inventory_foods = @inventory.inventory_foods

    @needed_foods = []
    @recipe_foods.each do |recipe_food|
      if !@inventory_foods.find_by(food_id: recipe_food.food_id)
        @needed_foods << recipe_food.food
      end
    end
  end

  
  private

  def shopping_list_params
    params.require(:shopping_list).permit(:recipe_id, :inventory_id)
  end
end
