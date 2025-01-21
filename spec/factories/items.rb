FactoryBot.define do
  factory :item do
    name              { Faker::Commerce.product_name } # 商品名
    description       { Faker::Lorem.paragraph } # 商品の説明
    category_id       { Faker::Number.between(from: 2, to: 11) } # カテゴリー
    condition_id      { Faker::Number.between(from: 2, to: 7) } # 商品の状態
    delivery_fee_id   { Faker::Number.between(from: 2, to: 3) } # 配送料の負担
    region_id         { Faker::Number.between(from: 2, to: 48) } # 発送元の地域
    shipping_time_id  { Faker::Number.between(from: 2, to: 4) } # 発送までの日数
    price             { Faker::Number.between(from: 300, to: 9_999_999) } # 価格
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
