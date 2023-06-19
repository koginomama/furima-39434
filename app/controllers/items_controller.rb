class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

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
  end

  def edit
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
