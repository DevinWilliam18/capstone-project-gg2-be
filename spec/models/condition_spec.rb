require 'rails_helper'

RSpec.describe Condition, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.build(:condition)).to be_valid
  end
  
  it "is invalid without a condition_type" do
    condition = FactoryBot.build(:condition, condition_type: nil)
    
    condition.valid?

    expect(condition.errors['condition_type']).to include("can't be blank")
  
  end
  
  # it "is invalid without a expiration_date" do
  #   condition = FactoryBot.build(:condition, expiration_date: nil)

  #   condition.valid?

  #   expect(condition.errors['expiration_date']).to include("can't be blank")
  # end

  # it " is invalid with a wrong date format" do

  #   condition = FactoryBot.build(:condition, expiration_date: 'Mon, 20 Jun 2022')

  #   condition.valid?

  #   expect(condition.errors['expiration_date']).to include("is invalid")

  # end
  
end
