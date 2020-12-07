class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:create]#ログインしていないユーザーが直商品、ログインページへ
  before_action :redirect_item_user_method#出品者が直接自分の商品購入ページに行かないようにする
  before_action :redirect_item_buy_method#直接売却済みの商品購入ページに行かないようにする
  def index
    @item = Item.find(params[:item_id])
    @furimaform = Furimaform.new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @furimaform = Furimaform.new(order_params)
     if @furimaform.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
       @furimaform.save
       redirect_to root_path
     else
       @item = Item.find(params[:item_id])
       render action: :index
     end
  end
 
  private
  def order_params
   params.require(:furimaform).permit(:post, :send_area_id, :city, :block, :build, :tel).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def redirect_item_user_method
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def redirect_item_buy_method
    if @item.buy.present? 
      redirect_to root_path
    end
  end
  
end

