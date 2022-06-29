FactoryBot.define do
  factory :volunteer do
    org_name { Faker::Name.name_with_middle }
    org_email {Faker::Internet.email}
    org_phone { Faker::PhoneNumber.cell_phone_with_country_code }
    org_address { Faker::Address.full_address }
    org_pass { Faker::Alphanumeric.alphanumeric }
  end
end