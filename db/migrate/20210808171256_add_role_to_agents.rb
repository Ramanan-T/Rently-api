class AddRoleToAgents < ActiveRecord::Migration[6.1]
  def change
    add_column :agents, :role, :string
  end
end
