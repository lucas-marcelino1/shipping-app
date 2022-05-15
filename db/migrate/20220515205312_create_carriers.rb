class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :corporation_name
      t.string :brand_name
      t.string :registration_number
      t.string :email_domain
      t.string :address

      t.timestamps
    end
  end
end
