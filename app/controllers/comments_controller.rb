class CommentsController < ApplicationController

  before_action :require_login, only: %i[create]
  before_action :find_item, only: %i[create]

  def create
    @comment = @item.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment added successfully..."
    else
      flash[:alert] = @comment.error.full_messages
    end
    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def edit
    @comment =  Comment.find(params[:id])
  end

  def destroy
    @comment =  Comment.find(params[:id])
    if @comment.delete
      flash[:notice] = "Comment deleted!"
    else
      flash[:error] = "Can't delete this comment"
    end
    @item = @comment.item
    respond_to do |format|
      format.js
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:name, :description);
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
