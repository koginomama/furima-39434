class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :addresses, :building, :phone_number, :prefecture_id, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は(-)ハイフンを含めて入力してください' }
    validates :city, :addresses, :user_id, :item_id, :token
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'は半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, city: city, addresses: addresses, building: building, phone_number: phone_number,
                   prefecture_id: prefecture_id, order_id: order.id)
  end
end
