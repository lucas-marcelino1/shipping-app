class RouteUpdate < ApplicationRecord
  belongs_to :service_order
  validates :hour, :day, :local, presence: true
  before_validation :check_date

  
  def set_hour
    self.hour.to_s.match(/\d{2}:\d{2}/)
  end

  def check_date
    if self.day.present? && self.day < Date.current
      self.errors.add(:day, "não pode ser anterior a hoje")
    end
  end

end
