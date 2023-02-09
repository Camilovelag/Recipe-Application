class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user
end
