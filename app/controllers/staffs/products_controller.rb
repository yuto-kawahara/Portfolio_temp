class Staffs::ProductsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to staffs_product_path(@product.id)
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to staffs_product_path(@product.id)
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to staffs_products_path
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :price, :image)
  end
end
