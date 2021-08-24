class ChangeCompanyContactToBigintInCompanies1 < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :company_contact, :bigint
  end
end
