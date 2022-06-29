class Food < ApplicationRecord

  validates :food_name, presence: true
  validates :food_quantity, presence: true, numericality: true
  validates :food_desc, presence: true
  validates :expiration_date, presence: true

  #/(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d/
  belongs_to :garbage_producer
  # validates_associated :garbage_producer, on: :create

  belongs_to :condition
  # validates_associated :condition, on: :create

  has_many :detail_orders
  has_many :orders, through: :detail_orders

  def self.parse_to_date(date_format)
    temp = date_format.split("-")
    
    date = Date.new(temp[2].to_i, temp[1].to_i, temp[0].to_i)
    
  end

  def self.by_id_producer(id_resto)
    where("garbage_producer_id = ?", "#{id_resto}")
  end

end
