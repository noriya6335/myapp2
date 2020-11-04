class CommentsController < ApplicationController
  before_action :set_comment,  only: [:destroy]
  def create
    Comment.create(comment_params)
    redirect_to item_path(params[:item_id])
  end

  def destroy
    @comment.destroy
    redirect_to item_path(params[:item_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
