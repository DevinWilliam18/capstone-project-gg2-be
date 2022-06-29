class Order < ApplicationRecord
  belongs_to :volunteer

  has_many :detail_orders
  has_many :foods, through: :detail_orders


  # apply "confirmed" as well as "finished time" column
  def self.modify_confirmation(hash_temp)
    if hash_temp[:status].eql? "NOT CONFIRMED"
      hash_temp[:status] = "CONFIRMED"

      hash_temp[:status]
    
    end
  end



  
end
