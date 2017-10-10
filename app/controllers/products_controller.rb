class ProductsController < ApplicationController
  before_action :load_category, only: %i(index)

  def new; end

  def index
    # @products = Product.sort_by_name
    # return if params[:category].nil?
    # @products = @category.products
    @products = if @category
      @category.products
    else
      Product.sort_by_name
    end
    @products = @products.search_by_name(params[:search])
  end

  def load_category
    unless params[:category].nil?
      @category = Category.find_by name: params[:category]
      return if @category
      render file: "public/404.html"
    end
  end

end
