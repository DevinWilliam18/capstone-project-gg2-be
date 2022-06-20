require 'rails_helper'

RSpec.describe Volunteer, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:volunteer)).to be_valid
  end

  
  it "is invalid without a org_name" do
    volunteer = FactoryBot.build(:volunteer, org_name: nil)

    volunteer.valid?

    expect(volunteer.errors[:org_name]).to include("can't be blank") 
  end
  
  it "is invalid without a org_email" do
    volunteer = FactoryBot.build(:volunteer, org_email: nil)

    volunteer.valid?

    expect(volunteer.errors[:org_email]).to include("can't be blank")

  end

  it "is invalid without a org_phone" do
    volunteer = FactoryBot.build(:volunteer, org_phone: nil)
    volunteer.valid?

    expect(volunteer.errors[:org_phone]).to include("can't be blank")
  end

  it "is invalid without a org_address" do
    volunteer = FactoryBot.build(:volunteer, org_address: nil)

    volunteer.valid?

    expect(volunteer.errors[:org_address]).to include("can't be blank")
  end
  it "is invalid without a org_pass" do
    volunteer = FactoryBot.build(:volunteer, org_pass: nil)

    volunteer.valid?

    expect(volunteer.errors[:org_pass]).to include("can't be blank")
  end

  it "is invalid with a wrong email format " do
    volunteer = FactoryBot.build(:volunteer, org_email: 'dede@mimicom')

    volunteer.valid?

    expect(volunteer.errors[:org_email]).to include("is invalid")
  end
  

  it "should require an unique email" do
    volunteer = FactoryBot.create(:volunteer, org_email: 'volunteerbb2be@gmail.com')

    volunteer2 = FactoryBot.build(:volunteer, org_email: 'volunteerbb2be@gmail.com')

    volunteer2.valid?

    expect(volunteer2.errors[:org_email]).to include("has already been taken")
  end

  it "should require a unique password" do
    volunteer = FactoryBot.create(:volunteer, org_pass: '1234')

    volunteer2 = FactoryBot.build(:volunteer, org_pass: '1234')

    volunteer2.valid?

    expect(volunteer2.errors[:org_pass]).to include("has already been taken")
  end

  describe "self#by_name" do
    it "should return a sorted array of results that match" do
        
      
      volunteer = Volunteer.create(
        org_name: 'Bersih-bersih',
        org_email: 'volunteerbb2be@gmail.com',
        org_phone: '08136789002',
        org_address: 'Jl. Mulawarman no 19',
        org_pass: '1234'
      )
  
      volunteer2 = Volunteer.create(
        org_name: 'Buang sampah',
        org_email: 'sampah@gmail.com',
        org_phone: '0812313123',
        org_address: 'Jl. Mulawarman no 100',
        org_pass: '0991'
      )

      volunteer3 = Volunteer.create(
        org_name: 'Badan peduli sampah',
        org_email: 'peduli@gmail.com',
        org_phone: '0822912898122',
        org_address: 'Jl. pahlawan no 90',
        org_pass: '09093'
      )

      expect(Volunteer.by_name("B")).to eq([volunteer3, volunteer, volunteer2])
    end

  end

end
