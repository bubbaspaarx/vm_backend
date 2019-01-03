class CreateMachineCashes < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_cashes do |t|
      t.integer :quantity
      t.references :machine, foreign_key: true
      t.references :money, foreign_key: true

      t.timestamps
    end
  end
end
