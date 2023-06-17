class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end

  def create

    #@item = Item.new(items_params)
  end

  private

  def items_params
    params.require(:items).permit(:item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :image)
  end

end
