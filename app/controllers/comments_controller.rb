class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      flash[:notice] = "Comment deleted!"
      redirect_to_root_path
    else
      flash[:error] = "Can't delete this comment"
      render :destroy
    end
  end
end
