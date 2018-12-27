class AdminController < ApplicationController
  skip_before_action :authorize
  
  http_basic_authenticate_with name: "sai", password: "12345678"
  def index
    redirect_to articles_url
  end
end
