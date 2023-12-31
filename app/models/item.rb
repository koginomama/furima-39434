class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  validates :item_category_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :item_sales_status_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :item_prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :item_name, :item_info, :image, presence: true
  validates :item_price, presence: true,
                         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は半角数字で入力してください' }
end
