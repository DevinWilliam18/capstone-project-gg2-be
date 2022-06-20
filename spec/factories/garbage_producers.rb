FactoryBot.define do
  factory :garbage_producer do

    producer_name { Faker::Name.name_with_middle }
    producer_pass { Faker::Internet.password }
    email_producer { Faker::Internet.free_email }
    address { Faker::Address.street_address }
    opening_time { "2022-06-17 21:18:52" }
    closing_time { "2022-06-17 21:18:52" }

    association :province, factory: :province
  end
end
