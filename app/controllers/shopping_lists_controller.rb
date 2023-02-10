class ShoppingListsController < ApplicationController
  def show
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @shopping_list = @recipe.recipe_foods.where.not(food: @inventory.foods)
  end
end
