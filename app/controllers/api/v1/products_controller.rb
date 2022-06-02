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

        if product.relations != nil 

            product.relations.each do |relation|
                relation.destroy!
            end
            product.update!(product_params)
    
            params[:product_multiops].each do |category_id|
                Relation.create(product_id: product.id, category_id: category_id[:value])
            end

        else
            product.update!(product_params)
        
        end
    
       

        render json: product, status: :ok
    rescue StandardError => error
        render json: error, status: :bad_request
    end

    def delete
        product = Product.find(params[:id])
        product.destroy!
        render json: product, status: :ok
    rescue StandardError => error
        render json: error, status: :bad_request
    end

    def my_categories
        product = Product.find(params[:id])
        render json: product.categories , status: :ok
    rescue StandardError
        head(:not_found) 
    end

    def add_imageFile
        product = Product.find(params[:id])

        if product.image.attached?
            product.image.purge
        end

        params[:imageFile].each do |imageFile|
            product.image.attach(imageFile)
        end
        render json: product
    rescue StandardError => error
        render json: error, status: :bad_request
    end


    private

    def product_params
        params.require(:product).permit(
            :name,
            :price,
            :description,
            :image,
            product_multiops: []
        )
    end


end
