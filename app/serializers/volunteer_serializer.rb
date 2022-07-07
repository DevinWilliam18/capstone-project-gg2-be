class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :org_name, :org_email, :org_phone, :org_address, :org_pass
  has_many :orders
end
