class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_session_user_id(user_id)
    session[:user_id] = user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    #TODO Remember the path if current_user is nil,
    # so that after successful login, we can pass him off to the main page he wanted to go
    redirect_to login_url, :alert => 'Please Login' if @current_user.nil?
  end

  helper_method :current_user


end
