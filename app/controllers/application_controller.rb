class ApplicationController < ActionController::Base
  before_action :authenticate
  before_action :authenticate_action

  helper_method :current_user
  helper_method :logged_in?

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate
    return if logged_in?

    redirect_to login_path,
                alert: t("flash_messages.authenticate_failure")
  end

  def authenticate_action
    return if current_user.permission? "#{controller_name}##{action_name}"

    redirect_back fallback_location: login_path,
                  alert: t("flash_messages.authenticate_action_failure")
  end

  def authenticate_same_user(user_id)
    return if user_id.to_i == current_user.id

    redirect_back fallback_location: login_path,
                  alert: t("flash_messages.authenticate_same_user_failure")
  end
end
