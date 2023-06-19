require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  # チェック用コード bundle exec rspec spec/models/item_spec.rb
  describe '商品新規登録' do
    context '出品ができる場合' do
      it 'item_name, item_info, item_price, item_category_id, item_sales_status_id, item_shipping_fee_status_id, item_prefecture_id, item_scheduled_delivery_id, image,user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'item_category_idが(---)では登録できない' do
        @item.item_category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_sales_status_idが(---)では登録できない' do
        @item.item_sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end

      it 'item_shipping_fee_status_idが(---)では登録できない' do
        @item.item_shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it 'item_prefecture_idが(---)では登録できない' do
        @item.item_prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it 'item_scheduled_delivery_idが(---)では登録できない' do
        @item.item_scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_priceが¥300以下では登録できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end

      it 'item_priceが¥9,999,999以上では登録できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end

      it 'item_priceが半角数字意外では登録できない' do
        @item.item_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
