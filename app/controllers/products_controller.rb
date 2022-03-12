class ProductsController < ApplicationController
  before_action :set_item, only: [:edit, :destroy]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to admin_users_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :detail, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
