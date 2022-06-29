require 'rails_helper'

RSpec.describe Food, type: :model do
  it "has a valid factory" do
    province = FactoryBot.create(:province)
    condition = FactoryBot.create(:condition)
    garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

    expect(FactoryBot.build(:food, garbage_producer_id: garbage_producer.id, condition_id: condition.id)).to be_valid
  end

  it "is invalid without food_name" do
    province = FactoryBot.create(:province)
    condition = FactoryBot.create(:condition)
    garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

    food = FactoryBot.build(:food, food_name: nil,  garbage_producer_id: garbage_producer.id, condition_id: condition.id)

    food.valid?

    expect(food.errors["food_name"]).to include("can't be blank")
  end
  
  it "is invalid without food_quantity" do
    province = FactoryBot.create(:province)
    condition = FactoryBot.create(:condition)
    garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

    food = FactoryBot.build(:food, food_quantity: nil,  garbage_producer_id: garbage_producer.id, condition_id: condition.id)

    food.valid?

    expect(food.errors["food_quantity"]).to include("can't be blank")
  end

  it "is invalid without food_desc" do
    province = FactoryBot.create(:province)
    condition = FactoryBot.create(:condition)
    garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

    food = FactoryBot.build(:food, food_desc: nil,  garbage_producer_id: garbage_producer.id, condition_id: condition.id)

    food.valid?

    expect(food.errors["food_desc"]).to include("can't be blank")
  end

  it "is invalid without expiration_date" do
    province = FactoryBot.create(:province)
    condition = FactoryBot.create(:condition)
    garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

    food = FactoryBot.build(:food, expiration_date: nil,  garbage_producer_id: garbage_producer.id, condition_id: condition.id)

    food.valid?

    expect(food.errors["expiration_date"]).to include("can't be blank")
  end

  # it "is invalid without condition_id" do
  #   province = FactoryBot.create(:province)
  #   condition = FactoryBot.create(:condition)
  #   garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

  #   food = FactoryBot.build(:food, garbage_producer_id: garbage_producer.id, condition_id: nil)

  #   food.valid?

  #   expect(food.errors["condition_id"]).to include("is invalid")
  # end


  # it "is invalid without producer_id" do
  #   province = FactoryBot.create(:province)
  #   condition = FactoryBot.create(:condition)
  #   garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

  #   food = FactoryBot.build(:food, condition_id: condition.id, garbage_producer_id: nil)

  #   food.valid?

  #   expect(food.errors["garbage_producer_id"]).to include("is invalid")
  # end

  it "should requires interger type in food_quantity " do

    province = FactoryBot.create(:province)
    condition = FactoryBot.create(:condition)
    garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

    food = FactoryBot.build(:food, food_quantity: "123df",  garbage_producer_id: garbage_producer.id, condition_id: condition.id)

    food.valid?

    expect(food.errors["food_quantity"]).to include("is not a number")

  end
  
  # it "is invalid with a wrong 'date' format" do
  #   province = FactoryBot.create(:province)
  #   condition = FactoryBot.create(:condition)
  #   garbage_producer = FactoryBot.create(:garbage_producer, province_id: province.id)

  #   food = FactoryBot.build(:food, expiration_date: "01-11-2022",  garbage_producer_id: garbage_producer.id, condition_id: condition.id)

  #   food.valid?

  #   expect(food.errors["expiration_date"]).to include("is invalid")
  # end

  describe "self#parse_to_date" do
    it "should handle 'dd-mm-YYYY' date format" do
      # volunteer1 = FactoryBot.create(:volunteer)

      expect(Food.parse_to_date("02-11-2020")).to eq(Date.new(2020,11,02))
    end
    
  end
  
end
