class ConditionSerializer < ActiveModel::Serializer
  attributes :id, :condition_type

  has_many :foods

end
