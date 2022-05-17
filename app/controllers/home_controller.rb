class HomeController < ApplicationController

  def index
    if admin_signed_in?
      @carriers = Carrier.all
    elsif carrier_user_signed_in?
      @carrier = current_carrier_user.carrier
    else

    end

  end
end