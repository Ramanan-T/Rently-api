class AddNameToAgents < ActiveRecord::Migration[6.1]
  def change
    add_column :agents, :name, :string
  end
end
