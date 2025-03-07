class ProductsController < ApplicationController
  def index
    @products = Product.all
    def show
      @product = Product.find(params[:id])
      @products = Product.includes(:category).all
    end
    end
 (Generated Products controller with index action)
 (Updated routes, index action, and index view)
  end
end
