class OrderItemsController < ApplicationController
  before_action :item_checking, only: %i[ create ]


  def create
    if @order.save
      flash[:notice] = "Product Added to Cart!"
    end
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update(order_params)
      flash.now[:notice] = "Product updated!"
    end
    @order_items = current_order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
      flash.now[:notice] = "Product Deleted!"
    end
    @order_items = current_order.order_items
  end

  def clearCart
    @order = current_order
    if @order.order_items.delete_all
      flash[:notice] = "cart has been clear"
    end
  end


  private
  def order_params
    params.require(:order_item).permit(:item_id, :quantity)
  end

  def item_checking
    @order = current_order

    @current_item = @order.order_items.find_by(item_id: params[:order_item][:item_id]);

    if(@current_item.present?)
      @current_item.update(quantity: @current_item.quantity + 1);
    else
      @order_item = @order.order_items.new(order_params)
    end
  end

end
