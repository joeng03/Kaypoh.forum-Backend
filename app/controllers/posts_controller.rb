class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/:id
  def show
    render json: @post
  end

  # POST /posts
  def create
    puts post_params
    @post = Post.new(post_params)
    
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    # A user can update a post only if the type of this PUT request is for starring a post, or they wrote it 
    puts post_params
    if params[:type] == "star" or current_user.id == @post.user_id
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "Not authorized to edit post"}, status: :unauthorized
    end
  end

  # DELETE /posts/:id
  def destroy
    # A user can delete a post only if they wrote it

    if current_user.id == @post.user_id
      @post.destroy
    else  
      render json: {error: "Not authorized to delete post"}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :stars, :tag, :image)
    end
end
