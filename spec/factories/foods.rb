FactoryBot.define do
  factory :food do
    food_name { "MyString" }
    food_quantity { 1 }
    food_desc { "MyText" }
    conditions { nil }
    producers { nil }
  end
end
