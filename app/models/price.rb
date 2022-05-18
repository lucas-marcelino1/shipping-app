class Price < ApplicationRecord
  validates :initial_volume, :final_volume, :initial_weight, :final_weight, :price_per_km, :minimal_distance, :minimal_price, numericality: {only_float: true, message: 'deve ser um número válido'}
  validates :initial_volume, :final_volume, :initial_weight, :final_weight, :price_per_km, :minimal_distance, :minimal_price, presence: true
  belongs_to :carrier
end
