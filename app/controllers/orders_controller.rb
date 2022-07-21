class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new

  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      # Payjp.api_key = "sk_test_dc26ca22581671a828960e69"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      # Payjp::Charge.create(
      #   amount: order_params[:price],  # 商品の値段
      #   card: order_params[:token],    # カードトークン
      #   currency: 'jpy'                 # 通貨の種類（日本円）
      # )
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
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def order_params
    # params.permit(:item_id).merge(user_id: current_user.id)
  # end

  # def shipping_params
    # params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order.id)
  # end
end