class ApplicationController < ActionController::Base
  before_action :authorize

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  rescue_from ActionController::UnknownFormat, with: :invalid_record

  rescue_from ActionController::MissingFile, with: :file_not_found

 protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, alert: "Please Signin"
    end
  end

  def record_not_found
    render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found 
  end

  def file_not_found
    render :file => "#{Rails.root}/public/500", :layout => false, :status => :not_found 
  end

  def invalid_record
    render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found 
  end
end
