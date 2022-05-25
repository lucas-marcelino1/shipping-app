class CreatePriceLogSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :price_log_searches do |t|
      t.float :volume
      t.float :weight
      t.integer :distance
      t.float :price
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
