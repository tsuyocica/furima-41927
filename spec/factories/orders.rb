FactoryBot.define do
  factory :order do
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    region_id {2}
    city {"東京都"}
    address_line {"1-1"}
    building_name {"東京ハイツ"}
    phone_number {"09012345678"}

  end
end
