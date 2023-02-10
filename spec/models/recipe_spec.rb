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
  end

  it 'should belong to a user' do
    expect(@recipe.user_id).to eq(@user.id)
  end

  it 'should have name' do
    expect(@recipe.name).to eq('Pizza Recipe')
  end

  it 'should have description' do
    expect(@recipe.description).to eq('Pizza Recipe Description')
  end

  it 'should have preparation_time' do
    expect(@recipe.preparation_time).to eq('1h')
  end

  it 'should have cooking_time' do
    expect(@recipe.cooking_time).to eq('40min')
  end

  it 'should have public' do
    expect(@recipe.public).to be_truthy
  end
end
