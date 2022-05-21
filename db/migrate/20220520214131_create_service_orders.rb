class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.references :carrier, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.string :pickup_address
      t.string :delivery_address
      t.string :item_code
      t.string :recipient_name
      t.string :recipient_CPF
      t.float :volume
      t.float :weight
      t.string :order_code

      t.timestamps
    end
  end
end
