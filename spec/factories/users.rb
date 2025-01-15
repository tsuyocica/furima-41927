FactoryBot.define do
  factory :user do
    nickname              { "やまちん" }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 4) + '1a' }
    password_confirmation { password }
    last_name             { "山田" }
    first_name            { "太郎" }
    last_name_kana        { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birth_date            { "1990-01-01" }
  end
end