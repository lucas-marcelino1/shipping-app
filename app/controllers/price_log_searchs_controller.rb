class PriceLogSearchsController < ApplicationController

  def index
    @prices_log = PriceLogSearch.all
  end
end