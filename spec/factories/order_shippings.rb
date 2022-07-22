FactoryBot.define do
  factory :order_shipping do
    postal_code             { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    city                    { Faker::Address.city }
    address                 { Faker::Address.street_address }
    building                { Faker::Address.secondary_address }
    phone_number            { Faker::Number.leading_zero_number(digits: 10) }
    token                   { 'tok_abcdefghijk00000000000000000' }
  end
end
