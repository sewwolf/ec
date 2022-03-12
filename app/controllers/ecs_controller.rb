class EcsController < ApplicationController
  skip_before_action :login_required, only: [:index]

  def index
    @total_price = my_cart.total_price
    @items = my_cart.items
  end

  def create
    if my_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])
    else
    end
  end

  def update
    if my_cart.update_item(product_id: params[:product_id], quantity: params[:quantity])
    else
    end
  end

  def destroy
    if my_cart.delete_item(product_id: params[:product_id])
    else
    end
end
