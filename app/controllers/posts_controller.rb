class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    elsif params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all.order("created_at DESC")
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id
    if @post.save(post_params)
      flash[:notice] = "Successfully created post"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post"
      redirect_to post_path
    else
      flash[:alert] = "Error updating post"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :admin_id, :all_tags, :image, :image_cache, :remove_image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end