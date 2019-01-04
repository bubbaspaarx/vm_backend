class Snack < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :machines, through: :stocks
  has_many :receipts, dependent: :destroy
  has_many :sales, through: :receipts

  def quantity(id)
    Stock.find_by(machine_id: id, snack_id: self.id)
  end

end
