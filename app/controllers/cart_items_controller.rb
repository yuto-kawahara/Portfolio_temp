class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart_item!,except: [:index, :destroy]

  def index
    @items = CartItem.all
    @total_price = 0
    @items.each do |item|
      @total_price += (item.product.price * item.quantity)
    end
  end

  def create
    if @item.blank?
      @item = current_user.cart_items.new(item_params)
    else
      @item.quantity += params[:cart_item][:quantity].to_i
    end
    if @item.save
      redirect_to cart_items_path
    end
  end

  def update
    item = CartItem.find(params[:id])
    if item.update(item_params)
      redirect_to cart_items_path
    end
  end

  def destroy
    binding.pry
    item = CartItem.find(params[:id])
    item.destroy
    redirect_to cart_items_path
  end


  private
  
  def setup_cart_item!
    @item = current_user.cart_items.find_by(product_id: params[:cart_item][:product_id])
  end

  def item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
