class AddCarrierToDeadline < ActiveRecord::Migration[7.0]
  def change
    add_reference :deadlines, :carrier, null: false, foreign_key: true
  end
end
