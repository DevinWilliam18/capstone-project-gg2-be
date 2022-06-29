FactoryBot.define do
  factory :food do
    food_name { Faker::Food.dish }
    food_quantity { 1 }
    food_desc { Faker::Food.description }
    expiration_date {"01-11-2020"}
    #Faker::Date.birthday
    association :condition, factory: :condition
    association :garbage_producer, factory: :garbage_producer

  end
end
