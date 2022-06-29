FactoryBot.define do
  factory :detail_order do
    association :order, factory: :order
    association :food, factory: :food

    # foods { nil }
    # orders { nil }
    quantity { 1 }
  end
end
