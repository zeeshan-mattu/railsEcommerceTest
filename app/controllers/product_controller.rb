class ProductController < ApplicationController

  def index
  end

  def show
    @products = Product.all()
  end

  def destroy
  end

  def edit
  end

end
