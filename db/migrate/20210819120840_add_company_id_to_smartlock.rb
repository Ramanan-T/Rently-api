class AddCompanyIdToSmartlock < ActiveRecord::Migration[6.1]
  def change
    add_column :smartlocks, :company_id, :integer
  end
end
