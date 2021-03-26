class ItemsController < ApplicationController
  def index
     @items = Item.order("crateed_at DESC")
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
  params.require(:item).permit(:title, :image, :price, :introduction, :category_id, :condition_id, :order_date_id, :prefecture_id, :trading_status_id).merge(user_id: current_user.id)
 end
end
