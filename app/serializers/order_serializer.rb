class OrderSerializer < ActiveModel::Serializer
  attributes :id, :finished_time, :status
  has_many :detail_orders

end
