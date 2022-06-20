class Condition < ApplicationRecord
    validates :condition_type, presence: true
    validates :expiration_date, presence: true, format: { with: /\A\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])\z/ }
end
