class AddPhoneToRenters < ActiveRecord::Migration[6.1]
  def change
    add_column :renters, :phone, :bigint
  end
end
