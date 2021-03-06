class Volunteer < ApplicationRecord
    validates :org_name, presence: true
    validates :org_email, presence: true, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }, uniqueness: true
    validates :org_phone, presence: true
    validates :org_address, presence: true
    validates :org_pass, presence: true, uniqueness: true

    has_many :orders
    def self.by_name(letter)
        where("org_name LIKE ?", "#{letter}%").order(:org_name)
    end

    def self.by_email_and_pass(params_hash)    
        where("org_email=? AND org_pass = ?","#{params_hash[:org_email]}" ,"#{params_hash[:org_pass]}")
    end
    
     
end
