class AddStatusToServiceOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :service_orders, :status, :integer, default: 0
  end
end
