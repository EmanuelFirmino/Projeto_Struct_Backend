class Api::V1::FavoritesController < ApplicationController

    def index
        favorites = Favorite.all
        render json: favorites, status: :ok 
    end

    def create
        favorite = Favorite.new(favorite_params)
        favorite.save!
        render json: favorite, status: :created

    rescue StandardError
        head(:unprocessable_entity)
    end 

    def update
        favorite = Favorite.find(params[:id])
        favorite.update!(favorite_params)
        render json: favorite, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        favorite = Favorite.find(params[:id])
        favorite.destroy!
        render json: favorite, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    private

    def relation_params
        params.require(:favorite).permit(
            :user_id,
            :product_id,
        )
    end
end
