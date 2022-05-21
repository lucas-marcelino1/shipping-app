class ServiceOrdersController < ApplicationController

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

end