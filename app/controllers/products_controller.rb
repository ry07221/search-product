class ProductsController < ApplicationController

  def index
    @p = Product.ransack(params[:q])
    @product = @p.result.includes(:category)
    set_product_column
    set_category_column
  end

  def search
    @q = Product.ransack(search_params)
    @expect_products = @q.result.includes(:category)
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def set_product_column
    @product_name = Product.select("name").distinct
    @product_size = Product.select("size").distinct
    @product_status = Product.select("status").distinct
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end

end