class HomesController < ApplicationController
  def top
    @products = Product.page(params[:page]).reverse_order.includes(:cart_items)
  end
  def about
  end
end
