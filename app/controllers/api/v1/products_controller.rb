module Api::V1
  class ProductsController < ApplicationController
    def index
      @products = Product.order("created_at DESC")
      render json: @products
    end

    def create
      @product = Product.create(product_params)
      render json: @product
    end
    def update
      @product = Product.find(params[:id])
      @product.update_attributes(product_params)
      render json: @product
    end
    private

      def product_params
        params.require(:product).permit(:title, :description)
      end

  end
end
