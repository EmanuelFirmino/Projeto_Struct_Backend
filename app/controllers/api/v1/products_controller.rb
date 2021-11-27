class Api::V1::ProductsController < ApplicationController

    def index
        products = Product.all
        render json: products, status: :ok 
    end

    def show
        product = Product.find(params[:id])
        render json: product, status: :ok
    rescue StandardError
        head(:not_found)
    end
    
    def create
        product = Product.new(product_params)
        product.save!
        render json: product, status: :created

    rescue StandardError
        head(:unprocessable_entity)
    end 

    def update
        product = Product.find(params[:id])
        product.update!(product_params)
        render json: product, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        product = Product.find(params[:id])
        product.destroy!
        render json: product, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def my_categories
        product = Product.find(params[:id])
        render json: product.categories , status: :ok
    rescue StandardError
        head(:not_found) 
    end

    private

    def product_params
        params.require(:product).permit(
            :name,
            :price,
            :description,
            :image
        )
    end


end
