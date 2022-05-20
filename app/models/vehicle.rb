class Vehicle < ApplicationRecord
  belongs_to :carrier
  validates :license_plate, :maximum_charge, presence: true
  validates :license_plate, uniqueness: true
  validates :maximum_charge, :year, numericality: {only_integer: true, greater_than: 0}
end
