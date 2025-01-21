FactoryBot.define do
  factory :order_form do
    postal_code     { '111-1111' }
    region_id       { 13 }
    city            { '千葉市' }
    address_line    { '千葉1-1-1' }
    building_name   { 'ABCタワー' }
    phone_number    { Faker::Number.leading_zero_number(digits: Faker::Number.between(from: 10, to: 11)) }
    token           { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }
  end
end
