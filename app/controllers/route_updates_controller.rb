class RouteUpdatesController < ApplicationController

  def edit
    @route_update = RouteUpdate.find(params[:id])
    @service_order = @route_update.service_order
  end

  def update
    @route_update = RouteUpdate.find(params[:id])
    if @route_update.update(params.require(:route_update).permit(:day, :hour, :local))
      redirect_to(edit_route_update_path(@route_update), notice: 'Rota atualizada com sucesso!')
    else
      flash.now[:notice] = 'Não foi possível atualizar a rota!'
      render 'edit'
    end
  end

  def to_finish
    @route_update = RouteUpdate.find(params[:id])
    @route_update.service_order.finished!
    redirect_to(service_orders_path, notice: 'A ordem de serviço foi finalizada!')
  end
  
end