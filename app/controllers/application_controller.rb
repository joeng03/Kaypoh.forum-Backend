class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def authenticate_admin!
      authenticate_user!
      render json: {
        error: "You are not authorized to perform this action as you are not an admin. "
      }, status: :forbidden unless current_user.admin_level > 0
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :username, :bio, :profile_picture])
    end
  
end
