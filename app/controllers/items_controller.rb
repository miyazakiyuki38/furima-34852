class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :set_item, only: [:show,:edit,:update]


  def index
    @items = Item.order('created_at DESC')
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
  # @item = Item.find(params[:id]後ほど使うかも)
 end

 def edit
  # @item = Item.find(params[:id]後ほど使うかも)
 end

 def update
   @item.update(item_params)
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
   end
end

private

def item_params
  params.require(:item).permit(:title, :image, :price, :introduction, :category_id, :condition_id, :order_date_id, :prefecture_id, :trading_status_id).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
 end 
end

