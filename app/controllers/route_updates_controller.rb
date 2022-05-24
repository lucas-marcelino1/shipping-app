class RouteUpdatesController < ApplicationController

  def edit
    @route_update = RouteUpdate.find(params[:id])
    @service_order = @route_update.service_order
  end

  def create
    @route_update = RouteUpdate.find(params[:id])
    @service_order = @route_update.service_order
    @route_update = RouteUpdate.new(service_order: @service_order, local: params[:local], hour: params[:hour], day: params[:day])
    if @route_update.save
      redirect_to(edit_route_update_path(@route_update), notice: 'Rota atualizada com sucesso!')
    else
      @service_order = @route_update.service_order
      flash.now[:notice] = 'Não foi possível atualizar a rota!'
      render 'edit'
    end
  end

  def to_finish
    @route_update = RouteUpdate.find(params[:id])
    @route_update.service_order.finished!
    @route_update.local = "Entregue ao destinatário"
    redirect_to(service_orders_path, notice: 'A ordem de serviço foi finalizada!')
  end
  
end