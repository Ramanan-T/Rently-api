class AddNameToRenters < ActiveRecord::Migration[6.1]
  def change
    add_column :renters, :name, :string
  end
end
