class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.references :snack, foreign_key: true
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
