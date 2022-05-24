class RouteUpdate < ApplicationRecord
  belongs_to :service_order
  validates :hour, :day, :local, presence: true
  
  def set_hour
    self.hour.to_s.match(/\d{2}:\d{2}/)
  end

end
