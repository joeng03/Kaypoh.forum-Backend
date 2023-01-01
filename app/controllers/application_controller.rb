class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :username, :bio, :profile_picture])
    end
  
end
