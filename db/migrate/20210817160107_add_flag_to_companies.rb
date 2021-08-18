class AddFlagToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :flag, :int
  end
end
