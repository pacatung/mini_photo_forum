class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user

  protected

  ### devise 本身就有current_user 這個方法  ### 覆寫!!
   def current_user
     if session[:user_id]
       User.find( session[:user_id] )
     else
       nil
     end
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end


end
