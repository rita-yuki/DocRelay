class HomeController < ApplicationController
  def index
    @user = current_user_name
  end
end
