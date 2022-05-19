class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.integer :initial_distance
      t.integer :final_distance
      t.integer :days

      t.timestamps
    end
  end
end
