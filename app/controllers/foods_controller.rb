class FoodsController < ApplicationController
  def index
    inventory = Inventory.find(params[:inventory_id])
    @foods = inventory.foods
  end
end
