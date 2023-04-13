class OrdersController < ApplicationController
before_action :authenticate_user!, only:[:index]
before_action :set_order, only:[:index, :create]

  def index
    @order_delivery = OrderDelivery.new
    if user_signed_in? && current_user.id == @order.user.id
       redirect_to root_path
    # else user_signed_in? && (current_user.id != @order.user.id) == @order.order.id
    #   redirect_to root_path
    end
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       @order_delivery.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_order
    @order = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end