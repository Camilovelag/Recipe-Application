require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create!(name: 'hanna', email: 'hannania002@gmail.com', password: '123456')
    @food = Food.create!(name: 'Pizza', price: 5, unit: 'grams')
    @recipe = Recipe.create!(
      user_id: @user.id, name: 'Pizza Recipe', description: 'Pizza Recipe Description',
      preparation_time: '1h', cooking_time: '40min', public: true
    )
    @recipe_food = RecipeFood.create!(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)
  end

  it 'should belong to a recipe' do
    expect(@recipe_food.recipe_id).to eq(@recipe.id)
  end

  it 'should belong to a food' do
    expect(@recipe_food.food_id).to eq(@food.id)
  end

  it 'should have a quanity' do
    expect(@recipe_food.quantity).to eq(1)
  end
end
