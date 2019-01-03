class SnackSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :price, :quantity
  def quantity
    Stock.find_by(machine_id: scope[:params]).quantity
  end
end
