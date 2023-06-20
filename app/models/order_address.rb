class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :addresses, :addresses, :addresses, :addresses, :prefecture_id :order_id
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :addresses, :order_id
    validates :phone_number, numericality: {only_integer: true, message: 'is invalid'}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save

      order = Order.create(user_id: user_id, item_id: item_id)
  
      Address.create(postal_code: postal_code, city: city, addresses: addresses, building: building, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)

    end

end