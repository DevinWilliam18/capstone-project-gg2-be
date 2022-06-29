FactoryBot.define do
  factory :condition do
    condition_type { "Not fit for human consumption" }
    # expiration_date { Faker::Date.birthday.strftime("%d-%m-%Y") }
  end
end
