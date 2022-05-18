class AddMinimalDistanceToPrice < ActiveRecord::Migration[7.0]
  def change
    add_column :prices, :minimal_distance, :float
  end
end
