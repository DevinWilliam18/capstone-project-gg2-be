require 'rails_helper'

RSpec.describe City, type: :model do
  it "has a valid factory" do
    
    province = FactoryBot.create(:province)



    expect(FactoryBot.build(:city, province_id: province.id)).to be_valid
  end  

end
