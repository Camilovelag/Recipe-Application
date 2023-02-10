require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create!(name: 'hanna', email: 'hannania002@gmail.com', password: '123456')
    @food = RecipeFood.new(quantity: 2, food_id: 1)
    @food1 = Food.create!(name: 'Pizza', price: 5, unit: 'grams')
  end

  it 'should have name' do
    expect(@user.name).to eq 'hanna'
  end
  it 'should have quantity' do
    expect(@food.quantity).to eq 2
  end
  it 'should have price' do
    expect(@food1.price).to eq 5
  end
end
