class ChangeVehicleFromOrderService < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:service_orders, :vehicle_id, true)
  end
end
