class Carrier < ApplicationRecord
  enum status: {able: 0, disable: 5}
  validates :corporation_name, :brand_name, :registration_number, :email_domain, presence: true
  validates :registration_number, uniqueness: true
  validates :email_domain, uniqueness: true
  validates :registration_number, length: {is: 18}
  validates :registration_number, format: {with: /\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}/, message: 'deve ter o formato XY.XYZ.XYZ/XYZA-XY'}
  has_many :vehicles
  has_many :carrier_users
  has_many :prices
  has_many :deadlines
  has_many :service_orders
  
  def description
    "#{self.corporation_name} - #{self.registration_number}"
  end

end
