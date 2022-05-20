class DeadlinesController < ApplicationController
  before_action :authenticate_carrier_user!
  def index
    @carrier = current_carrier_user.carrier
    @deadlines = @carrier.deadlines
  end

  def new
    @deadline = Deadline.new()
  end

  def create
    @carrier = current_carrier_user.carrier
    @deadline = Deadline.new(params.require(:deadline).permit(:initial_distance, :final_distance, :days).merge(carrier: @carrier))
    if @deadline.save
      redirect_to(deadlines_path, notice: 'Prazo cadastrado com sucesso')
    else
      flash.now[:notice] = 'Não foi possível realizar o cadastro deste prazo'
      render 'new'
    end
  end
end