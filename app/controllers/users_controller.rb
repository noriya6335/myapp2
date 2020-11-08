class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.where(user_id: @user.id)
    @comment = Comment.where(user_id: @user.id)
    @itemid = @comment.select(:item_id)
    @reviews = Item.where(id: @itemid)

    @user_profile = Profile.find_by(user_id: current_user.id)
  end

  private

end
