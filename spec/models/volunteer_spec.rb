require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  
  it "is invalid without a org_name" do
    volunteer = Volunteer.new(
      
      org_email: 'volunteerbb2be@gmail.com',
      org_phone: '08136789002',
      org_address: 'Jl. Mulawarman no 19',
      org_pass: '1234'

    )

    volunteer.valid?

    expect(volunteer.errors[:org_name]).to include("can't be blank") 
  end
  
  it "is invalid without a org_email" do
    volunteer = Volunteer.new(
      org_name: 'Bersih-bersih',
      org_phone: '08136789002',
      org_address: 'Jl. Mulawarman no 19',
      org_pass: '1234'
    )

    volunteer.valid?

    expect(volunteer.errors[:org_email]).to include("can't be blank")

  end

  it "is invalid without a org_phone" do
    volunteer = Volunteer.new(
      org_name: 'Bersih-bersih',
      org_email: 'volunteerbb2be@gmail.com',
      org_address: 'Jl. Mulawarman no 19',
      org_pass: '1234'
    )

    volunteer.valid?

    expect(volunteer.errors[:org_phone]).to include("can't be blank")
  end

  it "is invalid without a org_address" do
    volunteer = Volunteer.new(
      org_name: 'Bersih-bersih',
      org_email: 'volunteerbb2be@gmail.com',
      org_phone: '08136789002',
      org_pass: '1234'
    )

    volunteer.valid?

    expect(volunteer.errors[:org_address]).to include("can't be blank")
  end
  it "is invalid without a org_pass" do
    volunteer = Volunteer.new(
      org_name: 'Bersih-bersih',
      org_email: 'volunteerbb2be@gmail.com',
      org_phone: '08136789002',
      org_address: 'Jl. Mulawarman no 19'
    )

    volunteer.valid?

    expect(volunteer.errors[:org_pass]).to include("can't be blank")
  end

  it "is invalid with a wrong email format " do
    volunteer = Volunteer.new(
      org_name: 'Bersih-bersih',
      org_email: 'volunteerbb2b@easdacom',
      org_phone: '08136789002',
      org_address: 'Jl. Mulawarman no 19',
      org_pass: '1234'
    )

    volunteer.valid?

    expect(volunteer.errors[:org_email]).to include("is invalid")
  end
  

  it "should require an unique email" do
    volunteer = Volunteer.create(
      org_name: 'Bersih-bersih',
      org_email: 'volunteerbb2be@gmail.com',
      org_phone: '08136789002',
      org_address: 'Jl. Mulawarman no 19',
      org_pass: '1234'
    )

    volunteer2 = Volunteer.new(
      org_name: 'Halo sampah',
      org_email: 'volunteerbb2be@gmail.com',
      org_phone: '0812313123',
      org_address: 'Jl. Mulawarman no 100',
      org_pass: '1234567'
    )

    volunteer2.valid?

    expect(volunteer2.errors[:org_email]).to include("has already been taken")
  end

  it "should require a unique password" do
    volunteer = Volunteer.create(
      org_name: 'Bersih-bersih',
      org_email: 'volunteerbb2be@gmail.com',
      org_phone: '08136789002',
      org_address: 'Jl. Mulawarman no 19',
      org_pass: '1234'
    )

    volunteer2 = Volunteer.new(
      org_name: 'Halo sampah',
      org_email: 'sampah@gmail.com',
      org_phone: '0812313123',
      org_address: 'Jl. Mulawarman no 100',
      org_pass: '1234'
    )

    volunteer2.valid?

    expect(volunteer2.errors[:org_pass]).to include("has already been taken")
  end

end
