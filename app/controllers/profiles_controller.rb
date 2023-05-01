class ProfilesController < ApplicationController
  def edit
    user
  end

  def update
    if user.update_with_password(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:image, :first_name, :last_name, :password, :password_confirmation, :current_password)
  end
end
