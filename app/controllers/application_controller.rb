class ApplicationController < ActionController::Base
  before_action :authenticate

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

    redirect_to login_path, alert: "このアプリの使用にログインが必要です。"
  end

  def authenticate_admin
    return if current_user.role == "admin"

    redirect_back fallback_location: login_path, alert: "この操作はadmin権限を持ちユーザーのみが行えます。"
  end

  def authenticate_manager_or_admin
    return if %w[manager admin].include? current_user.role

    redirect_back fallback_location: login_path, alert: "この操作はadminやmanager権限を持ちユーザーのみが行えます。"
  end
end
