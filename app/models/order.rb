class Order < ApplicationRecord
  belongs_to :volunteer

  has_many :detail_orders
  has_many :foods, through: :detail_orders


  # apply "confirmed" as well as "finished time" column
  # def self.modify_finish_time
    
  #   update_all(finished_time: DateTime.now)

  # end



  
end
