class ApplicationController < ActionController::API


    def authentication_failure
        render json: { message: 'Falha no login!' }, status: :unauthorized 
    end
end
