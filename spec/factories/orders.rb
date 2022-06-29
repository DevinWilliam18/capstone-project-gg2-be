FactoryBot.define do

  factory :order do
    order_time { "2022-06-18 15:08:25" }
    status { "MyString" }
    # finished_time { nil }
    association :volunteer, factory: :volunteer
  end
end
