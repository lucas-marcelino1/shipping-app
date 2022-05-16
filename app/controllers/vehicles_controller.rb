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
      @carriers = Carrier.order(:name)
      flash.now[:notice] = 'Não foi possível cadastrar o veículo!'
      render 'new'
    end
  end

  def index
    @vehicles = Vehicle.all
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    @carriers = Carrier.order(:name)
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(params.require(:vehicle).permit(:license_plate, :brand, :model, :year, :maximum_charge, :carrier_id))
      redirect_to(vehicles_path, notice: 'Veículo atualizado com sucesso!')
    else
      flash.now[:notice] = 'Não foi possível atualizar o veículo!'
      @carriers = Carrier.order(:name)
      render 'edit'
    end
  end
end