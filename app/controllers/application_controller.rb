class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    current_token = session[:session_token]
    @current_user || User.find_by(session_token: current_token)
  end

  def log_in!(user)
    session[:session_token] = user.session_token
  end

  def log_out!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:eror] = "You must be loggeed in"
      redirect_to new_session_url
    end
  end

end
