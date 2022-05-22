class CreateRouteUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :route_updates do |t|
      t.date :day
      t.time :hour
      t.string :local

      t.timestamps
    end
  end
end
