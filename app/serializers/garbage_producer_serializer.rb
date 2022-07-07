class GarbageProducerSerializer < ActiveModel::Serializer
  attributes :id, :producer_name, :producer_pass, :email_producer, :address, :opening_time, :closing_time, :province_id
  has_many :foods
end
