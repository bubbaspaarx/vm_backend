class MoneySerializer < ActiveModel::Serializer
  attributes :id, :denomination, :value, :quantity

  def quantity
     MachineCash.find_by(machine_id: scope[:params]).quantity
  end
end
