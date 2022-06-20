require 'rails_helper'

RSpec.describe GarbageProducer, type: :model do
  
  it "has a valid factory" do
    province = FactoryBot.create(:province)

    expect(FactoryBot.build(:garbage_producer, province_id: province.id)).to be_valid
  end

  it "is invalid without a org_name" do
    province = FactoryBot.create(:province)

    garbage_producer = FactoryBot.build(:garbage_producer, producer_name: nil, province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:producer_name]).to include("can't be blank") 
  end
  
  it "is invalid without a org_email" do
    province = FactoryBot.create(:province)

    garbage_producer = FactoryBot.build(:garbage_producer, email_producer: nil, province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:email_producer]).to include("can't be blank")

  end

  
  it "is invalid without a org_address" do
    province = FactoryBot.create(:province)

    garbage_producer = FactoryBot.build(:garbage_producer, address: nil, province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:address]).to include("can't be blank")
  end

  it "is invalid without a org_pass" do
    province = FactoryBot.create(:province)
    garbage_producer = FactoryBot.build(:garbage_producer, producer_pass: nil, province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:producer_pass]).to include("can't be blank")
  end

  it "is invalid without an opening_time" do
    province = FactoryBot.create(:province)
    garbage_producer = FactoryBot.build(:garbage_producer, opening_time: nil, province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:opening_time]).to include("can't be blank")
  end

  it "is invalid without a closing_time" do
    province = FactoryBot.create(:province)
    garbage_producer = FactoryBot.build(:garbage_producer, closing_time: nil, province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:closing_time]).to include("can't be blank")
  end

  it "is invalid with a wrong email format " do
    province = FactoryBot.create(:province)
    garbage_producer = FactoryBot.build(:garbage_producer, email_producer: 'dede@mimicom', province_id: province.id)

    garbage_producer.valid?

    expect(garbage_producer.errors[:email_producer]).to include("is invalid")
  end
  

  it "should require an unique email" do
    province = FactoryBot.create(:province)

    garbage_producer = FactoryBot.create(:garbage_producer, email_producer: 'garbage_producerbb2be@gmail.com', province_id: province.id)

    garbage_producer2 = FactoryBot.build(:garbage_producer, email_producer: 'garbage_producerbb2be@gmail.com', province_id: province.id)

    garbage_producer2.valid?

    expect(garbage_producer2.errors[:email_producer]).to include("has already been taken")
  end

  describe "self#by_province" do
    it "should return a collection of 'garbage_producers' related to the province_id" do
      
      province = FactoryBot.create(:province)

      province2 = FactoryBot.create(:province)

      garbage_producer = FactoryBot.create(:garbage_producer, email_producer: 'garbage_producerbb2be111@gmail.com', province_id: province.id, producer_pass: '1234')
  
      garbage_producer2 = FactoryBot.create(:garbage_producer, email_producer: 'garbage_producerbb2be222@yahoo.com', province_id: province.id, producer_pass: '9090')

      garbage_producer3 = FactoryBot.create(:garbage_producer, email_producer: 'garbage_producerbb2be333@gmail.com', province_id: province2.id, producer_pass: '00qwoei')

      

      expect(GarbageProducer.by_id_province(province.id)).to eq([garbage_producer, garbage_producer2])


    end
    
  end

  describe "self#by_name" do
    it "should return a sorted array of results that match" do
      province2 = FactoryBot.create(:province)

      garbage_producer = FactoryBot.create(:garbage_producer, email_producer: 'garbage_producerbb2be111@gmail.com', province_id: province2.id, producer_pass: '1234', producer_name: "Gardapangan food waste")
  
      garbage_producer2 = FactoryBot.create(:garbage_producer, email_producer: 'garbage_producerbb2be222@yahoo.com', province_id: province2.id, producer_pass: '9090', producer_name: "Garda Depan")

      expect(GarbageProducer.by_name("Garda")).to eq([garbage_producer2, garbage_producer])

    end
    
  end
  
  
  

end
