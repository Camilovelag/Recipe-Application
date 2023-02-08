class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods
end
