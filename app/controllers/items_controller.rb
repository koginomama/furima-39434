class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end
end
