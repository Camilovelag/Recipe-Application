class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods
end
