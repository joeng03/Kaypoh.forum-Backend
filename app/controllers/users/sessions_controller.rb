class Users::SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      if current_user 
        render json: current_user
      else
        render json: {error: "Unauthorized"}, status: :unauthorized
      end
    end

    def respond_to_on_destroy
      current_user ? log_out_failure : log_out_success
    end

    def log_out_success
      render json: { message: "Successfully logged out." }, status: :ok
    end

    def log_out_failure
      render json: { message: "Failed to log out."}, status: :unauthorized
    end
  end
  