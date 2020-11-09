class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
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
  
  def show
    
  end

  def edit
    @user = current_user
    @profiles = Profile.find_by(user_id: @user.id)

  end

  def update
    @profile.update(profile_params)
    redirect_to user_path(current_user.id)
  end
  
  private
    def profile_params
      params.require(:profile).permit(:image, :favorite, :profiles).merge(user_id: current_user.id)
    end
    def set_profile
      @profile = Profile.find_by(user_id: current_user.id)
    end
end
