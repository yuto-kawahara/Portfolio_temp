class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order.includes(:cart_items)
  end

  def show
    @product = Product.find(params[:id])
    @item = CartItem.new
  end
end
