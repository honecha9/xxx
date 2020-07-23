class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @group = @user.group.order("created_at DESC")
    @profile = Profile.find_by(user_id: params[:id])
  end

  def search
    @users = User.all.search(params[:search])
  end
  private

  def set_pro
    User.joins(:profiles)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
