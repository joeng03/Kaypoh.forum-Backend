class StarsController < ApplicationController
    before_action :authenticate_user!

    # POST /stars
    def create
        # Users can only star posts on their own behalf
        if current_user.id == params[:user_id]
            @star = Star.new({'user_id'=>current_user.id, 'post_id'=>params[:post_id]})
            if @star.save
                render json: @star, status: :created
              else
                render json: @star.errors, status: :unprocessable_entity
              end
        else
            render json: {error: "Not authorized to star post"}, status: :unauthorized
        end 
    end

    # DELETE /stars/:id
    def destroy
        # Users can only unstar posts on their own behalf
            begin
                @star = Star.find(params[:id])
                if current_user.id === @star.user_id
                    @star.destroy
                else
                    render json: {error: "Not authorized to unstar post"}, status: :unauthorized
                end 
            rescue => exception
                render json: {error: "Cannot unstar post as it is not starred previously"}
            end
      end
end
