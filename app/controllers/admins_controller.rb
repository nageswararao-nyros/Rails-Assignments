class AdminsController < ApplicationController
  skip_before_action :authorize
  
  http_basic_authenticate_with name: "sai", password: "12345678"

  def index
    
  end

  def notify
    @users = User.all
    NewUserMailer.notify_all(@users).deliver_now
  end
end
