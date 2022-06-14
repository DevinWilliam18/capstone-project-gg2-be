class Volunteer < ApplicationRecord
    validates :org_name, presence: true
    validates :org_email, presence: true, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
    validates :org_phone, presence: true
    validates :org_address, presence: true
    validates :org_pass, presence: true
    


end
