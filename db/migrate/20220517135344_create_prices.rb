class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :initial_volume
      t.float :final_volume
      t.float :initial_weight
      t.float :final_weight
      t.float :price_per_km
      t.float :minimal_price
    

      t.timestamps
    end
  end
end
