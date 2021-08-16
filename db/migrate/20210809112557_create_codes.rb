class CreateCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :codes do |t|
      t.integer :code
      t.integer :smartlock_id

      t.timestamps
    end
  end
end
