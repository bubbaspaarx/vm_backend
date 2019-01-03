class Sale < ApplicationRecord
  belongs_to :machine
  has_many :receipts, dependent: :destroy
  has_many :snacks, through: :receipts
end
