class DetailOrderSerializer < ActiveModel::Serializer
  attributes :id, :food_id, :quantity
end
