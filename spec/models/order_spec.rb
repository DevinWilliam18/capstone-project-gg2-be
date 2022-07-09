require 'rails_helper'

RSpec.describe Order, type: :model do

  # it "has a valid factory" do
  #   vol = FactoryBot.create(:volunteer)
  #   expect(FactoryBot.build(:order, volunteer_id: vol.id)).to be_valid
  # end 


  # describe "self#modify_confirmation" do
  #   it "should handlle updating a confirmation message" do
  #     vol1 = FactoryBot.create(:volunteer)

  #     ord1 = FactoryBot.create(:order, status: "CONFIRMED", volunteer_id: vol1.id)

  #     ord2 = FactoryBot.create(:order, status: "NOT CONFIRMED", volunteer_id: vol1.id)

  #     expect(Order.modify_confirmation(ord2)).to eq(ord1[:status]) 
  #   end
    

  # end
end
