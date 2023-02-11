require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  describe '#index' do
    before(:each) do
      User.destroy_all
      @user = User.create!(name: 'hann', email: 'hannania002@gmail.com', password: '123456')
      @food = Food.create!(name: 'Pizza', price: 5, unit: 'grams')
      @recipe = Recipe.create!(
        user_id: @user.id, name: 'Pizza Recipe', description: 'Pizza Recipe Description',
        preparation_time: '1h', cooking_time: '40min', public: true
      )

      visit users_path
      fill_in 'Email', with: 'hannania002@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit recipes_path
    end

    it 'should display recipe title' do
      expect(page).to have_content('Pizza Recipe')
    end

    it 'should display recipe description' do
      expect(page).to have_content('Pizza Recipe Description')
    end

    it 'should display a remove button' do
      expect(page).to have_content('REMOVE')
    end

    it 'when user clicks on REMOVE, it deletes the recipe' do
      click_button 'REMOVE'
      expect(page).to have_no_content('Pizza Recipe')
    end
  end
end
