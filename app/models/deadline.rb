class Deadline < ApplicationRecord
  validates :initial_distance, :final_distance, :days, presence: true
  validates :initial_distance, comparison: {less_than: :final_distance, message: 'deve ser menor que a distância final'}
  validates :final_distance, comparison: {greater_than: :initial_distance, message: 'deve ser maior que a distância inicial'}
  validates :days, numericality: {greater_than_or_equal_to: 1}
  belongs_to :carrier
end
