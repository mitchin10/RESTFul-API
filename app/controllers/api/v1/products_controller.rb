module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :edit, :update, :destroy]

      def index
        @products = Product.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'All Products', data: @products }, status: :ok
      end

      def show
        render json: { status: 'SUCCESS', message: 'Product Item', data: @product }, status: :ok
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: { status: 'SUCCESS', message: 'Saved Product', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Product not saved', data: @product.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @product.update_attributes(product_params)
          render json: { status: 'SUCCESS', message: 'Updated Product', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Product not updated', data: @product.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        if @product.destroy
          render json: { status: 'SUCCESS', message: 'Deleted Product', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Product not saved', data: @product.errors }, status: :unprocessable_entity
        end
      end

      private
        def set_product
          @product = Product.find(params[:id])
        end

        def product_params
          params.permit(:product_name, :description)
        end
    end
  end
end
