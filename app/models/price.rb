class Price < ApplicationRecord
  validates :initial_volume, :final_volume, :initial_weight, :final_weight, :price_per_km, :minimal_distance, :minimal_price, numericality: {only_float: true, message: 'deve ser um número válido'}
  validates :initial_volume, :final_volume, :initial_weight, :final_weight, :price_per_km, :minimal_distance, :minimal_price, presence: true
  validates :initial_volume, comparison: {less_than: :final_volume}
  validates :final_volume, comparison: {greater_than: :initial_volume}
  validates :initial_weight, comparison: {less_than: :final_weight}
  validates :final_weight, comparison: {greater_than: :initial_weight}
  belongs_to :carrier
end
