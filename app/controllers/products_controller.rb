class ProductsController < ApplicationController
  before_action :load_category, only: %i(index)

  def new; end

  def index
    @products = if @category
      @category.products
    else
      Product.search_by_price select_price
    end.search_by_name(params[:search]).sort_by_name
  end

  def load_category
    unless params[:category].nil?
      @category = Category.find_by name: params[:category]
      return if @category
      render file: "public/404.html"
    end
  end

  def select_price
    if params[:reson].present?
      return if params[:reson][:price] == Settings.controllers.products.all
      start, last = params[:reson][:price].split(Settings.controllers.products.to)
      start..last
    end
  end
end
