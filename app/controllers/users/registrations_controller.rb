class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

 def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :user_name, :role_id])
 end

 def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:role, :password, :password_confirmation, :current_password, :role_id])
 end


 def update_resource(resource, params)
  if params[:password].blank? && params[:password_confirmation].blank?
    resource.update_without_password(params.except(:current_password))
  else
    super
  end

  def after_update_path_for(resource)
    root_path
  end

 def edit
  super
 end
end