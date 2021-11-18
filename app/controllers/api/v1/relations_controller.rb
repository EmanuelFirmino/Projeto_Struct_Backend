class Api::V1::RelationsController < ApplicationController

    def index
        relations = Relation.all
        render json: relations, status: :ok 
    end

    def create
        relation = Relation.new(relation_params)
        relation.save!
        render json: relation, status: :created

    rescue StandardError
        head(:unprocessable_entity)
    end 

    def update
        relation = Relation.find(params[:id])
        relation.update!(relation_params)
        render json: relation, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        relation = Relation.find(params[:id])
        relation.destroy!
        render json: relation, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    private

    def relation_params
        params.require(:relation).permit(
            :product_id,
            :category_id,
        )
    end
end
