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
    @post = Post.new(sanitize_params)

    if @post.save
      redirect_to @post
    else
      render html: "Sorry, it did not save"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(sanitize_params)
      redirect_to @post
    else
      render html: "Sorry, it did not update"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
    def sanitize_params
      params.require(:post).permit(:title, :content, :img_url, :slug, :category_id, :featured)
    end
end
