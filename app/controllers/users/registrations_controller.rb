class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
        build_resource(sign_up_params)
    
        resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            register_success 
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      end

    def update
      puts account_update_params
        self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
        prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    
        resource_updated = update_resource(resource, account_update_params)
        yield resource if block_given?
        if resource_updated
          set_flash_message_for_update(resource, prev_unconfirmed_email)
          bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

    
          #respond_with resource, location: after_update_path_for(resource)
          render json: resource
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
    end
    
    protected

    def update_resource(resource, params)
      # Require current password if user is trying to change password.
      return super if params["password"]&.present?
    
      # Allows user to update registration information without password.
      resource.update_without_password(params.except("current_password"))
      puts params.except("current_password")
    end

    private

    def current_token
        request.env['warden-jwt_auth.token']
    end

    def register_success
        render json: @user, status: :created
    end

end