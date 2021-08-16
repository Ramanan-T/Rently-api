class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :company_id
      t.string :property_name
      t.string :property_price
      t.string :property_desc
      t.string :property_address

      t.timestamps
    end
  end
end
