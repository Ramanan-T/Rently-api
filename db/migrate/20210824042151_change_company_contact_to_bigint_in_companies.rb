class ChangeCompanyContactToBigintInCompanies < ActiveRecord::Migration[6.1]
  def up
    change_column :companies, :company_contact, :bigint
  end
end
