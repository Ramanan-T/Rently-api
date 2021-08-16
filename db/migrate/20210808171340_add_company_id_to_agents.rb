class AddCompanyIdToAgents < ActiveRecord::Migration[6.1]
  def change
    add_column :agents, :company_id, :integer
  end
end
