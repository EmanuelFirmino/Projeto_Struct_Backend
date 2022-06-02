class Api::V1::CategoriesController < ApplicationController

    def index
        categories = Category.all
        render json: categories, status: :ok 
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    rescue StandardError
        head(:not_found)
    end
    
    def create
        category = Category.new(category_params)
        category.save!
        render json: category, status: :created

    rescue StandardError
        head(:unprocessable_entity)
    end 

    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: category, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        category = Category.find(params[:id])
        category.destroy!
        render json: category, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def my_products
        category = Category.find(params[:id])
        render json: category.products , status: :ok
    rescue StandardError
        head(:not_found) 
    end

    private

    def category_params
        params.require(:category).permit(
            :name,
        )
    end
end
