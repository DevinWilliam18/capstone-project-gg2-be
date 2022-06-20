FactoryBot.define do
  factory :city do

    city_name { Faker::Address.city }
    association :province, factory: :province

  end
end
