FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '竈門' }
    first_name { '炭治郎' }
    last_name_kana { 'カマド' }
    first_name_kana  { 'タンジロウ' }
    birth_date { Faker::Date.in_date_period }
  end
end