class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new()
  end

  def create
    @carrier = current_carrier_user.carrier
    @vehicle = Vehicle.new(params.require(:vehicle).permit(:license_plate, :brand, :model, :year, :maximum_charge).merge(carrier: @carrier))
    if @vehicle.save
      redirect_to(vehicles_path, notice: 'Veículo cadastrado com sucesso')
    else
      
      flash.now[:notice] = 'Não foi possível cadastrar o veículo!'
      render 'new'
    end
  end

  def index
    @carrier = current_carrier_user.carrier
    @vehicles = @carrier.vehicles
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @carrier = current_carrier_user.carrier
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(params.require(:vehicle).permit(:license_plate, :brand, :model, :year, :maximum_charge).merge(carrier: @carrier))
      redirect_to(vehicles_path, notice: 'Veículo atualizado com sucesso!')
    else
      flash.now[:notice] = 'Não foi possível atualizar o veículo!'
      render 'edit'
    end
  end
end