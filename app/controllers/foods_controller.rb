class FoodsController < ApplicationController
  def index
    @foods = Food.includes(:inventory).where(inventories: { user_id: current_user.id })
  end
end
