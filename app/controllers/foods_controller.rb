class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new
    @food.name = params[:food][:name]
    @food.price = params[:food][:price]
    @food.unit = params[:food][:unit]

    if @food.save!
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    p 'jhabs;iasnd;asknf;fkjabsf;ajn;akbsjf;kasj flasbhf;nas;nfa;sj '
    p params[:id]
    @food = Food.find(params[:id])
    @food.destroy!
    redirect_to foods_path, notice: 'Food was successfully destroyed.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :unit)
  end
end
