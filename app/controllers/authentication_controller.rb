class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]
  skip_before_action :authenticate_action

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.alert = t("flash_messages.login_failure")
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: t("flash_messages.logout_success")
  end
end
