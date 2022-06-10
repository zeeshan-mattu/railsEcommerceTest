class CommentsController < ApplicationController

  before_action :require_login, only: :create

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment added successfully..."
    else
      render('new')
    end
  end

  def update
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


  private

  def comment_params
    params.require(:comment).permit(:name, :description);
  end


  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
