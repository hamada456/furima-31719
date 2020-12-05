class OrdersController < ApplicationController
  #before_action :authenticate_user!, except: [:create]


  def index
    @item = Item.find(params[:item_id])
    @furimaform = Furimaform.new
  end

  #def new
    #@address = Address.new
  #end
 
  def create
    binding.pry
    @furimaform = Furimaform.new(order_params)
     if @furimaform.valid?
       @furimaform.save
       redirect_to root_path
     else
       @item = Item.find(params[:item_id])
       render action: :index
     end
  end
 
  private
  def order_params
   params.require(:furimaform).permit(:post, :send_area_id, :city, :block, :build, :tel).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
