class PriceLogSearch < ApplicationRecord
  validates :weight, :volume, :price, :deadline_days, presence: true

  belongs_to :carrier
end
