class HomeController < ApplicationController
  def index
    @carriers = Carrier.all
  end
end