FactoryBot.define do
  factory :province do
    province_name { Faker::Address.state }
  end
end
