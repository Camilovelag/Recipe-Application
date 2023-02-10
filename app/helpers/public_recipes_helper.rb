module PublicRecipesHelper
  def food_items(recipe)
    RecipeFood.includes(:food).where(recipe_id: recipe.id).length
  end

  def foods_price(recipe)
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: recipe.id)
    @recipe_foods.sum(0.0) { |item| item.quantity * item.food.price }
  end
end
