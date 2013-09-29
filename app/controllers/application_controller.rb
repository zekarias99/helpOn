class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    include SessionsHelper
   $cities = City.includes(:state)

   
helper_method :current_user

 private


   def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by_remember_token(remember_token)
  end

 
  def admin_user
  	redirect_to(root_url) unless current_user.admin?
  end
end
