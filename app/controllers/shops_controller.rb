class ShopsController < ApplicationController
  before_action :find_current_cart
  def index
    @items = Item.all
    @order_item = @current_order.order_items.new
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @order_item = @current_order.order_items.new
  end

  def search
    @items = Item.where("title LIKE ?",["%#{params[:query]}%"])
  end
  def find_current_cart
    @current_order = current_order
  end

end
