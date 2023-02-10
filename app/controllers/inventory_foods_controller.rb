class InventoryFoodsController < ApplicationController
  def create
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new(inventory_food_params)
    return unless @inventory_food.save

    redirect_to inventory_path(@inventory)
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(@inventory_food.inventory)
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:inventory_id, :food_id, :quantity)
  end
end
