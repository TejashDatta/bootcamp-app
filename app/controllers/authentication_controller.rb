class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.alert = "ログインが失敗しました。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました。"
  end
end
