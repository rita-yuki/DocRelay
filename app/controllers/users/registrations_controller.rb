class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :user_name, :role_id])
  end

  # アカウント更新用のパラメータを設定
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password, :role_id])
  end

  # パスワードが空の場合、パスワードなしで更新
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params.except(:current_password))
    else
      super
    end
  end

  # 更新後のリダイレクト先
  def after_update_path_for(resource)
    root_path
  end
end
