class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
