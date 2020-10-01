class Ver1::PostsController < ApplicationController
  before_action :set_ver1_post, only: [:show, :update, :destroy]

  # GET /ver1/posts
  # GET /ver1/posts.json
  def index
    @ver1_posts = Ver1::Post.all
  end

  # GET /ver1/posts/1
  # GET /ver1/posts/1.json
  def show
  end

  # POST /ver1/posts
  # POST /ver1/posts.json
  def create
    @ver1_post = Ver1::Post.new(ver1_post_params)

    if @ver1_post.save
      render :show, status: :created, location: @ver1_post
    else
      render json: @ver1_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ver1/posts/1
  # PATCH/PUT /ver1/posts/1.json
  def update
    if @ver1_post.update(ver1_post_params)
      render :show, status: :ok, location: @ver1_post
    else
      render json: @ver1_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ver1/posts/1
  # DELETE /ver1/posts/1.json
  def destroy
    @ver1_post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ver1_post
    @ver1_post = Ver1::Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ver1_post_params
    params.require(:post).permit(:content, :user_id, :media)
  end
end
