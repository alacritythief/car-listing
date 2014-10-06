class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      flash[:notice] = "Car listing posted."
      redirect_to cars_path
    else
      flash[:notice] = "Warning: We couldn't list your car."
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage, :description)
  end
end
