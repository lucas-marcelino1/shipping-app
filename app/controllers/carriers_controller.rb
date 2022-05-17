class CarriersController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @carrier = Carrier.new()
  end

  def create
    @carrier = Carrier.new(params.require(:carrier).permit(:corporation_name, :brand_name, :registration_number, :email_domain, :address))
    if @carrier.save
      redirect_to(root_path, notice: 'Transportadora cadastrada com sucesso')
    else
      flash.now[:notice] = 'Não foi possível cadastrar a transportadora'
      render 'new'
    end
  end

  def edit
    @carrier = Carrier.find(params[:id])
  end

  def update
    @carrier = Carrier.find(params[:id])
    if @carrier.update(params.require(:carrier).permit(:corporation_name, :brand_name, :registration_number, :email_domain, :address))
      redirect_to(root_path, notice: 'Transportadora atualizada com sucesso')
    else
      flash.now[:notice] = 'Não foi possível atualizar a transportadora'
      render 'edit'
    end
  end

end