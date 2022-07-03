class GarbageProducer < ApplicationRecord
    validates :producer_name, presence: true
    validates :producer_pass, presence: true, uniqueness: true
    validates :email_producer, presence: true, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }, uniqueness: true
    validates :address, presence: true
    validates :opening_time, presence: true
    validates :closing_time, presence: true

    has_many :foods
    # validates_associated :foods

    belongs_to :province
    # validates_associated :province, on: :create

    def self.by_id_province(param)
        where("province_id = ?", "#{param}")
    end

    def self.by_name(param)
        where("producer_name LIKE ?", "#{param}%").order(:producer_name)
    end

end
