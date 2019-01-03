class AddColumnToSnack < ActiveRecord::Migration[5.2]
  def change
    add_column :snacks, :image, :string
  end
end
