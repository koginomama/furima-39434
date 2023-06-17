class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  validates :item_category_id, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :item_sales_status_id, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :item_shipping_fee_status_id, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :item_prefecture_id, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :item_scheduled_delivery_id, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :item_name, :item_info, :item_price, :image,  presence: true

end
