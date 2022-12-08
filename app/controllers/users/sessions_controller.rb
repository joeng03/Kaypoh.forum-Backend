class Users::SessionsController < Devise::SessionsController
    respond_to :json
    
    private

    def current_token
        request.env['warden-jwt_auth.token']
    end

    def respond_with(resource, _opts = {})
        render json: { 
            username: current_user.username,
            email: current_user.email,
            token: current_token
        }, status: :ok
    end

    def respond_to_on_destroy
      current_user ? log_out_success : log_out_failure
    end

    def log_out_success
      render json: { message: "Successfully logged out." }, status: :ok
    end

    def log_out_failure
      render json: { message: "Failed to log out."}, status: :unauthorized
    end
  end
  