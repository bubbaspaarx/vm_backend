class Money < ApplicationRecord
  has_many :machine_cashes
  has_many :machine, through: :machine_cashes
end
