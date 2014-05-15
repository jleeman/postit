class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first

    if @post.save
      flash[:notice] = "Your post has been saved."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

end