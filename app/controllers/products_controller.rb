class ProductsController < ApplicationController
  def index
    @products = Product.all
    def show
      @product = Product.find(params[:id])
      @products = Product.includes(:category).all
    end
    end
  end
end
