class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]

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
  
  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
       @item.destroy
    end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
     if current_user.id != @item.user_id || @item.order.present?
      redirect_to action: :index
     end
  end
            
end
