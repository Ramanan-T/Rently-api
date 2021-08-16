class CreateSmartlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :smartlocks do |t|
      t.integer :serial_num
      t.integer :property_id

      t.timestamps
    end
  end
end
