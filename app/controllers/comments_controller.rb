class CommentsController < ApplicationController
	before_action :find_commentable
	before_action :authenticate_user!, except: [:index]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @blog = Blog.find_by_id(params[:blog_id]) if params[:blog_id]
    if @comment.save
      respond_to do |format|
	    	format.js
        format.json { render json: @comment, status: :created }
	    end
    else
      flash[:notice] = @comment.errors.full_messages.join(", ")
      redirect_to blog_path(@blog)
	  end
    # if 
    #   redirect_to :back, notice: 'Your comment was successfully posted!'
    # else
    #   redirect_to :back, notice: "Your comment wasn't posted!"
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Blog.find_by_id(params[:blog_id]) if params[:blog_id]
  end
end
