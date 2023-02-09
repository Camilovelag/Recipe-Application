class Inventory < ApplicationRecord
  belongs_to :user, optional: true, required: false
  has_many :inventory_foods, dependent: :destroy
end
