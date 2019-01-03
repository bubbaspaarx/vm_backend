class Receipt < ApplicationRecord
  belongs_to :snack
  belongs_to :sale
end
