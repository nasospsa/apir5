class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  def index
    @posts = Post.includes(:category, :tags).all

    respond_to do |format|
      format.json { render json: @posts }
      format.jsonAPI { render json: @posts, adapter: :JsonApi }
    end
  end

  def new
    @post = Post.new
    render json: @post
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(build_tags post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(build_tags post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def build_tags(prms)
    post_attrs = prms.to_h
    post_attrs['tags'] = post_attrs['tags'].map { |tag_attrs|
      Tag.find_or_initialize_by tag_attrs['tag']
    }
    post_attrs
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :body, :published, :category_id, tags: [tag: :key])
  end
end
