require 'rails_helper'

RSpec.describe DetailOrder, type: :model do

  it "has a valid factory" do
    order = FactoryBot.create(:order)
    food = FactoryBot.create(:food) 
    expect(FactoryBot.build(:detail_order, order_id: order.id, food_id: food.id)).to be_valid
  end

  it "is invalid without qty" do
    order = FactoryBot.create(:order)
    food = FactoryBot.create(:food) 

    detail = FactoryBot.build(:detail_order, order_id: order.id, food_id: food.id, quantity: nil)

    detail.valid?

    expect(detail.errors["quantity"]).to include("can't be blank")

  end

end
