class Machine < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :snacks, through: :stocks
  has_many :sales
  has_many :receipts, through: :sales
  has_many :machine_cashes
  has_many :money, through: :machine_cashes
end
