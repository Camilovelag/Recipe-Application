class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :recipe_foods

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
