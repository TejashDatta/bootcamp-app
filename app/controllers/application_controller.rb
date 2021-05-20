class ApplicationController < ActionController::Base
  # before_action :authenticate

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate
    return if logged_in?

    redirect_to action: "static_pages#authentication_required"
  end
end
