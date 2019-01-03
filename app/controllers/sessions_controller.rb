class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def forgot_password
    redirect_to forgot_password_users_path
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to articles_url, alert: "User logged in :D"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "You have Succefully logged out"
  end
end
