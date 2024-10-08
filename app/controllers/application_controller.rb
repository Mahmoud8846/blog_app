class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'You need to log in to access this page.'
    end
  end
end
