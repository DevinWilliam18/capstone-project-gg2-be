FactoryBot.define do
  factory :garbage_producer do
    producer_name { "MyString" }
    producer_pass { "MyString" }
    email_producer { "MyString" }
    address { "MyText" }
    opening_time { "2022-06-17 21:18:52" }
    closing_time { "2022-06-17 21:18:52" }
  end
end
