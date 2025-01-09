class Users::RegistrationsController < ApplicationController
  before_action :configure_account_update_params, only: [:update]
end

def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :user_name, :role_id])
end

def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:role, :password, :password_confirmation, :current_password, :role_id])
end
end