class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(current_user), notice: 'プロフィールを登録しました'
    else
      redirect_to root_path
    end
  end
  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end
  private
    def profile_params
      params.require(:profile).permit(:image, :favorite, :profiles).merge(user_id: current_user.id)
    end

end
