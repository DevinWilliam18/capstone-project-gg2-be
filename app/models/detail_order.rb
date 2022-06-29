class DetailOrder < ApplicationRecord
  belongs_to :food
  belongs_to :order

  validates :quantity, presence: true

  
end
