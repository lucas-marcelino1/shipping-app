class Api::V1::CarriersController < ActionController::API

  def index
    @carriers = Carrier.all
    render status: :ok, json: @carriers, except: [:created_at, :updated_at]
  end
end