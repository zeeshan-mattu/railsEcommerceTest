class ProductsController < ApplicationController

  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product Added"
      redirect_to products_path
    else
      flash[:error] = "Failed To Add"
      render :new
    end
  end

  def edit
    # authorize @product
  end

  def update

    if @product.update_attributes(product_params)
      flash[:notice] = "product Updated"
      redirect_to products_path
    else
      flash[:error] = "Failed to update"
      render :edit
    end
  end

  def destroy

    # authorize @product
    if @product.delete
      flash[:notice] = "Product Deleted!"
      redirect_to products_path
    else
      false[:error] = "Faild to delete this product!"
      render :destroy
    end

  end

  private

  def product_params
    params.require(:product).permit(:user_id, :name, :quantity, :size )
  end

  def set_product
    @product = Product.find(params[:id])
  end




end
