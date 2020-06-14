class ProfilesController < ApplicationController
  
  before_action :set_group
  
  def new
    @profile = Profile.new
    @profiles = @user.profile.includes(:user)
  end

  def create
    @profile = @user.profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:sex,:like,:dislike,:thinking,:live).merge(user_id: current_user.id)
  end

  def set_group
    @user = User.find(params[:user_id])
  end
end
