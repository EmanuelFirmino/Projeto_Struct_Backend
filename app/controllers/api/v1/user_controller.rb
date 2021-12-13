class Api::V1::UserController < ApplicationController

    acts_as_token_authentication_handler_for User, only: [:logout, :show]
    wrap_parameters :user, include: [:name, :password, :email, :profile_pic]
    
    def login
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: 200
        else
            head(:unauthorized)
        end
    rescue StandardError => error
        render json: error, status: 404
    end

    def logout
        current_user.update! authentication_token: nil
        render json: {message: 'Volte sempre!'}
    rescue StandardError => error
        render json: error, status: :bad_request
    end

    def index
        users = User.all
        render json: users, status: 200
    end

    def create
        user = User.new(user_params)
        user.save!
        render json: user, status: 201
    rescue StandardError => error
        render json: error.message, status: 500
    end

    def show
        render json: current_user, status: 200
    end

    def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: 200
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        user = User.find(params[:id])
        user.destroy!
        render json: user, status: 200
    rescue StandardError
        head(:bad_request)
    end

    def my_favorites
        user = User.find(params[:id])
        render json: user.products , status: :ok
    rescue StandardError
        head(:not_found) 
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :profile_pic)
    end
end
