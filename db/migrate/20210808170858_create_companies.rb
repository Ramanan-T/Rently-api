class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.integer :company_contact
      t.string :company_address

      t.timestamps
    end
  end
end
