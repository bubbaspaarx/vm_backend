class MachineSerializer < ActiveModel::Serializer
  attributes :id, :name, :snacks
  has_many :sales
  has_many :receipts, through: :sales
end
