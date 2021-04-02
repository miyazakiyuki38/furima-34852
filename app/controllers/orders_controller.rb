class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: [:index]
  before_action :move_to_index

  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    # @order = Order.find(params[:order_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      # ↑もしかしたら(エラーがでたら)@order
    redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number, :price).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

   def sold_out_item
    if @item.present?
      redirect_to root_path 
      # render :index
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
    @item = Item.find(params[:item_id])
    unless @item.user_id != current_user.id
      redirect_to root_path
    end
end
end

