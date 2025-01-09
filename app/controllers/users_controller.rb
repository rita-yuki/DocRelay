class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if user_params[:password].blank? && user_params[:password_confirmation].blank?
      success = @user.update(user_params.except(:password, :password_confirmation, :current_password))
    else
      success = @user.update_with_password(user_params)
    end

  if success
    redirect_to root_path, notice: 'ユーザー情報が更新されました。'
  else
    puts @user.errors.full_messages
    render :edit
  end
end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation, :current_password, :role_id)
  end
end