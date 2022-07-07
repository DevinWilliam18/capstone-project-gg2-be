class FoodSerializer < ActiveModel::Serializer
  attributes :id, :food_name, :food_quantity, :food_desc, :expiration_date, :condition_id, :garbage_producer_id
  has_many :detail_orders
end
