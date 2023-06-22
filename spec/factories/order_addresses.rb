FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    city { '渋谷区' }
    addresses { '1-1' }
    building { 'ビル' }
    phone_number { '00011112222' }
    prefecture_id { '1' }
    association :user
    association :item
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
