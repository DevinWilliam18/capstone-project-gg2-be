class ProvinceSerializer < ActiveModel::Serializer
  attributes :id, :province_name

  has_many :cities
end
