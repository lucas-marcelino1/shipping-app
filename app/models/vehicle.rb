class Vehicle < ApplicationRecord
  belongs_to :carrier
  validates :license_plate, :maximum_charge, presence: true
  validates :license_plate, uniqueness: true
end
