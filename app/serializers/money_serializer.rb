class MoneySerializer < ActiveModel::Serializer
  attributes :id, :denomination, :value, :quantity

  def quantity
     MachineCash.find_by(machine_id: scope[:params], money_id: self.object.id).quantity
  end
end
