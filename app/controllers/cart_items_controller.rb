class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart_item!,except: [:index, :destroy_all]
  respond_to :html, :js

  def index
    @items = CartItem.includes(:product)
  end

  def create
    if @item.blank?
      @item = current_user.cart_items.new(item_params)
    else
      @item.quantity += params[:cart_item][:quantity].to_i
    end
    if @item.save
      @items = CartItem.includes(:product)
    end
  end

  def update
    @item.update(item_params)
    @items = CartItem.includes(:product)
  end

  def destroy
    @item.destroy
    @items = CartItem.includes(:product)
  end

  def destroy_all
    CartItem.destroy_all
    @items = CartItem.includes(:product)
  end


  private
  
  def setup_cart_item!
    @item = current_user.cart_items.find_by(product_id: params[:cart_item][:product_id])
  end

  def item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
