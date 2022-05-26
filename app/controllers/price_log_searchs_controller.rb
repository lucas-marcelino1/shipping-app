class PriceLogSearchsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @prices_log = PriceLogSearch.all
  end
end