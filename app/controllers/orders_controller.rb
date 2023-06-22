class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_sold_item, only:[:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :city, :addresses, :building, :phone_number, :prefecture_id, :order_id, ).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

  def check_sold_item
    @item = Item.find(params[:item_id])
    if @item.order.present? && @item.order.item_id == @item.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:item_price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類
      )
  end
end
