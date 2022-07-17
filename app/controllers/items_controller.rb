class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :price, :user).merge(user_id: current_user.id)
  end


  

          
end
