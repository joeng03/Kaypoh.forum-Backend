class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username, :profile_picture, :stars, :bio])
    end
  
end
