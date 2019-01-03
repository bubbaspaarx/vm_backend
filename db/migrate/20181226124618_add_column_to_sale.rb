class AddColumnToSale < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :machine, foreign_key: true
  end
end
