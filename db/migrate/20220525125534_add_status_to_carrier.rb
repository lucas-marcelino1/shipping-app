class AddStatusToCarrier < ActiveRecord::Migration[7.0]
  def change
    add_column :carriers, :status, :integer, default: 0
  end
end
