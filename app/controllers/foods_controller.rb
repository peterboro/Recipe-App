class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(
      name: food_params[:name],
      measurement_unit: food_params[:measurement_unit],
      price: food_params[:price],
      user_id: current_user.id
    )

    if @food.save
      flash[:success] = 'Food added'
      redirect_to user_foods_path(current_user.id)
    else
      flash.now[:error] = 'Food Not Added'
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])

    redirect_to user_food_index_path(current_user.id)
    if @food.destroy
      flash[:success] = 'Food deleted'
    else
      flash.now[:error] = 'Food Not Deleted'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
