FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    city { `渋谷区` }
    addresses { 1 - 1 }
    building { 'ビル' }
    phone_number { 0o0011112222 }
    prefecture_id { 1 }
  end
end
