require 'rails_helper'

RSpec.describe Province, type: :model do
  
  
  it "has a valid factory" do
    expect(FactoryBot.build(:province)).to be_valid
  end


  # it "is invalid if a province's name contains numbers or other types other than string" do

  #   province = FactoryBot(:province, province_name: 'Sulawesi')
    
  # end
end
