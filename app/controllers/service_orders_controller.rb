class ServiceOrdersController < ApplicationController
  before_action :authenticate_carrier_user!, only: [:index, :show, :to_accept, :to_reject]
  before_action :authenticate_admin!, only: [:new, :create]


  def new
    @service_order = ServiceOrder.new
    @carriers = Carrier.order(:name)
  end

  def create
    @service_order = ServiceOrder.new(params.require(:service_order).permit(:item_code, :weight, :volume, :recipient_name, :recipient_CPF, :pickup_address, :delivery_address, :carrier_id))
    if @service_order.save
      redirect_to(root_path, notice: 'Ordem de serviço cadastrada com sucesso')
    else
      @carriers = Carrier.order(:name)
      flash.now[:notice] = 'Não foi possível cadastrar a ordem de serviço.'
      render 'new'
    end
  end

  def index
    @service_orders = current_carrier_user.carrier.service_orders
  end

  def show
    @os = ServiceOrder.find(params[:id])
    @vehicles = current_carrier_user.carrier.vehicles
  end

  def to_accept
    @service_order = ServiceOrder.find(params[:id])
    @service_order.vehicle_id = params[:service_order][:vehicle_id]
    if @service_order.vehicle == nil
      @service_order.errors.add(:vehicle_id, 'é necessário')
      @carriers = Carrier.order(:name)
      return redirect_to(service_order_path(@service_order))
    end
    @service_order.accepted!
    @route_update = RouteUpdate.new(service_order: @service_order, day: Date.today, hour: Time.now, local: 'Ainda não saiu para entrega.')
    @route_update.save!
    redirect_to(root_path, notice: 'Ordem de serviço aceita!')
  end

  def to_reject
    @service_order = ServiceOrder.find(params[:id])
    @service_order.rejected!
    redirect_to(root_path, notice: 'Ordem de serviço rejeitada!')
  end

  def search
    @code = params["query"]
    @s = ServiceOrder.find_by(order_code: @code)
    if @s.present? 
      @route_updates = @s.route_updates
    else
      redirect_to(root_path, notice: 'Encomenda não encontrada. Verifique o código!')
    end
  end

end