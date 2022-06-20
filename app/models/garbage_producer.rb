class GarbageProducer < ApplicationRecord
    validates :producer_name, presence: true
    validates :producer_pass, presence: true, uniqueness: true
    validates :email_producer, presence: true, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }, uniqueness: true
    validates :address, presence: true
    validates :opening_time, presence: true
    validates :closing_time, presence: true

    def self.by_id_province(id_prov)
        where("province_id = ?", "#{id_prov}")
    end

    # def self.by_city(city)
    #     where()
    # end

    def self.by_name(prov_name)
        where("producer_name LIKE ?", "#{prov_name}%").order(:producer_name)
    end

end
