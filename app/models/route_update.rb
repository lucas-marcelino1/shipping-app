class RouteUpdate < ApplicationRecord
  belongs_to :service_order


  def set_hour
    self.hour.to_s.match(/\d{2}:\d{2}/)
  end

end
