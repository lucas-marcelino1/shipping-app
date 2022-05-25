class PricesController < ApplicationController
  before_action :authenticate_carrier_user!, only: [:new, :create, :index]
  before_action :authenticate_admin!, only: [:search]
  
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

  def search
    @volume = params[:volume].to_f
    @weight = params[:weight].to_f
    @distance = params[:distance].to_i
    @prices = Price.where("initial_volume <= ? AND final_volume >= ? AND initial_weight <= ? AND final_weight >= ?",
    @volume, @volume, @weight, @weight)
    @prices_and_deadlines = {}

    @prices.each do |p|
      if p.carrier.able?
        @deadline = Deadline.find_by("initial_distance <= ? AND final_distance >= ? AND carrier_id = ?", @distance, @distance, p.carrier_id)
        if @deadline.present?
          @prices_and_deadlines[p] = @deadline
          if p.minimal_distance >= @distance
            @calculated_price = p.minimal_price
          else
            @calculated_price = p.price_per_km * @distance
          end 
          @p = PriceLogSearch.new(volume: @volume, weight: @weight, distance: @distance, price: @calculated_price, deadline_days: @deadline.days, carrier: p.carrier)
          @p.save!
        end
      end
    end
    
    if @prices_and_deadlines.empty?
      redirect_to(root_path, notice: 'Não foram encontradas transportadoras que atendem as especificações do produto!')
    end
  end
end