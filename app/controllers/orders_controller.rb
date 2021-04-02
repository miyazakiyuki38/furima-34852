class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item
  before_action :move_to_index

  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
    redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

   def sold_out_item
    if @item.order.present?
      redirect_to root_path 
    end
   end

  def pay_item

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    unless @item.user_id != current_user.id 
      redirect_to root_path
    end
  end

    def set_item
      @item = Item.find(params[:item_id])
    end 
end

