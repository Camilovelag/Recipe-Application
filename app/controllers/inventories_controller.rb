class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path, notice: "Inventory was successfully deleted."
  end  
end
