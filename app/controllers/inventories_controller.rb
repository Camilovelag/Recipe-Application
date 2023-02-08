class InventoriesController < ApplicationController
  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods
  end
end
