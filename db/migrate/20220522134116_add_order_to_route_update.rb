class AddOrderToRouteUpdate < ActiveRecord::Migration[7.0]
  def change
    add_reference :route_updates, :service_order, null: false, foreign_key: true
  end
end
