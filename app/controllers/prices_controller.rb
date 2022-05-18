class PricesController < ApplicationController
  before_action :authenticate_carrier_user!

  def new
    @price = Price.new()
  end

  def create
    @user = current_carrier_user
    @price = Price.new(params.require(:price).permit(:initial_weight, :final_weight, :initial_volume, :final_volume, :price_per_km, :minimal_distance, :minimal_price).merge(carrier: @user.carrier))
    if @price.save
      redirect_to(prices_path, notice: 'O preço foi cadastrado com sucesso!')
    else
      flash.now[:notice] = "Não foi possível cadastrar o preço!"
      render 'new'
    end
  end

  def index
    @user = current_carrier_user
    @prices = @user.carrier.prices
  end
end