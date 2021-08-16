class AddPhoneToAgents < ActiveRecord::Migration[6.1]
  def change
    add_column :agents, :phone, :bigint
  end
end
