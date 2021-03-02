class BlogsController < ApplicationController
	before_action :find_blog, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs=Blog.all
  end

  def show
    @blog = Blog.includes(user: :comments, comments: :comments).find(params[:id])
  end

  def new
    @blog=Blog.new
  end

  def create
    @blog= Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Blog added!"
      redirect_to blogs_path
    else
      flash[:notice] = @blog.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "Blog updated!"
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      flash[:notice] = "Blog removed!"
      redirect_to blogs_path
    end
  end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :user_id)
  end
end
