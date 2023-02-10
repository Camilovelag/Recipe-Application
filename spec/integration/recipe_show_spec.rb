require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  describe '#index' do
    before(:each) do
      User.destroy_all
      @user = User.create!(name: 'hann', email: 'hannania002@gmail.com', password: '123456')
      @user.confirm
      @food = Food.create!(name: 'Pizza', price: 5, unit: 'grams')
      @recipe = Recipe.create!(
        user_id: @user.id, name: 'Pizza Recipe', description: 'Pizza Recipe Description',
        preparation_time: '1h', cooking_time: '40min', public: true
      )
      @recipe_food = RecipeFood.create!(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)

      visit users_path
      fill_in 'Email', with: 'hannania002@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit recipe_path(@recipe)
    end

    it 'should display recipe title' do
      expect(page).to have_content('Pizza Recipe')
    end

    it 'should display preparation time' do
      expect(page).to have_content('Preparation time: 1h')
    end

    it 'should display cooking time' do
      expect(page).to have_content('Cooking time: 40min')
    end

    it 'should display recipe description' do
      expect(page).to have_content('Pizza Recipe Description')
    end

    it 'should display an ingredient' do
      expect(page).to have_content('Pizza')
      expect(page).to have_content('1 grams')
      expect(page).to have_content('&dollar; 5.0')
    end
  end
end
