class AddDeadlineToPriceLogSearch < ActiveRecord::Migration[7.0]
  def change
    add_column :price_log_searches, :deadline_days, :integer
  end
end
