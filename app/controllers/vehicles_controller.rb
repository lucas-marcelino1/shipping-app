class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new()
    @carriers = Carrier.order(:name)
  end

  def create
    @vehicle = Vehicle.new(params.require(:vehicle).permit(:license_plate, :brand, :model, :year, :maximum_charge, :carrier_id))
    if @vehicle.save
      redirect_to(vehicles_path, notice: 'Veículo cadastrado com sucesso')
    else
      render 'new'
    end
  end

  def index
    @vehicles = Vehicle.all
  end
end