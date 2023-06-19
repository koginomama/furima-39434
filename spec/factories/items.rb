FactoryBot.define do
  factory :item do
    item_name { '犬' }
    item_info { 'かわいい犬です' }
    item_category_id { '1' }
    item_sales_status_id { '1' }
    item_shipping_fee_status_id { '1' }
    item_prefecture_id { '1' }
    item_scheduled_delivery_id { '1' }
    item_price { '398000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
