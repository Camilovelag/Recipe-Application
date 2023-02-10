class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    @recipe_foods = @recipe.recipe_foods
    @inventory_foods = @inventory.inventory_foods

    @total_price = 0

    @needed_foods = []
    @recipe_foods.each do |recipe_food|
      unless @inventory_foods.find_by(food_id: recipe_food.food_id)
        @needed_foods << { food: recipe_food.food, quantity: recipe_food.quantity }
      end
    end
    @total_price = @needed_foods.sum(0.0) { |item| item[:quantity] * item[:food].price }
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:recipe_id, :inventory_id)
  end
end
