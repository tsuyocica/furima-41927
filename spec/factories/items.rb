FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    category_id { 1 }
    condition_id { 1 }
    delivery_fee_id { 1 }
    region_id { 1 }
    shipping_time_id { 1 }
    price { 1 }
    user { nil }
  end
end
