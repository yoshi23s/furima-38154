class OrdersController < ApplicationController
  
  before_action :set_item, only: [:index, :create]

  def index
    authenticate_user!
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
    # @order = Order.create(order_params)
    # @shipping = Shipping.create(shipping_params)
    # if @shipping.save
    # redirect_to root_path
    # end

    # @order = Order.new(order_params)
    # @order.save
    # create = new + save
  end

  
  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  # def order_params
    # params.permit(:item_id).merge(user_id: current_user.id)
  # end

  # def shipping_params
    # params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order.id)
  # end
end