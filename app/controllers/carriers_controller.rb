class CarriersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_carrier, only: [:edit, :update, :to_able, :to_disable]
  
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
  end

  def update
    if @carrier.update(params.require(:carrier).permit(:corporation_name, :brand_name, :registration_number, :email_domain, :address))
      redirect_to(root_path, notice: 'Transportadora atualizada com sucesso')
    else
      flash.now[:notice] = 'Não foi possível atualizar a transportadora'
      render 'edit'
    end
  end

  def to_able
    @carrier.able!
    redirect_to(root_path, notice: 'A transportadora foi ativada com sucesso!')
  end

  def to_disable
    @carrier.disable!
    redirect_to(root_path, notice: 'A transportadora foi desativada com sucesso!')
  end

  private

  def set_carrier
    @carrier = Carrier.find(params[:id])
  end

end