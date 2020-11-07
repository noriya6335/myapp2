class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.where(user_id: current_user.id)
    @comment = Comment.where(user_id: current_user.id)
    @itemid = @comment.select(:item_id)
    @reviews = Item.where(id: @itemid)




  end

  private

end
