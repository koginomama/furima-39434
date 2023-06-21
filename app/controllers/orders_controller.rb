class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :city, :addresses, :building, :phone_number, :prefecture_id, :order_id, ).merge(user_id: current_user.id, item_id: item.id)
  end
end
