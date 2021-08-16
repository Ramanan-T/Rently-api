class CreateCheckins < ActiveRecord::Migration[6.1]
  def change
    create_table :checkins do |t|
      t.integer :renter_id
      t.integer :property_id
      t.integer :serial_code

      t.timestamps
    end
  end
end
