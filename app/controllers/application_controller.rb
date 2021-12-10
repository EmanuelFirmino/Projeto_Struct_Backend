class ApplicationController < ActionController::API

    def is_admin
        unless current_user.is_admin
            head :unauthorized
        end
    end

    def authentication_failure
        render json: { message: 'Falha no login!' }, status: :unauthorized 
    end
end
