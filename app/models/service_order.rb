class ServiceOrder < ApplicationRecord
  enum status: {pending: 0, accepted: 5, finished: 10, rejected: 15}
  belongs_to :carrier
  belongs_to :vehicle, optional: true
  has_one :route_update
  validates :weight, :volume, numericality: {greater_than_or_equal_to: 1}
  validates :weight, :volume, :pickup_address, :delivery_address, :recipient_CPF, :recipient_name, :item_code, :order_code, presence: true
  before_validation :generate_code

 
  private

  def generate_code
    self.order_code = SecureRandom.alphanumeric(15).upcase
  end

end
