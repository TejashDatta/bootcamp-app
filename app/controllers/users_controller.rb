class UsersController < ApplicationController
  before_action :authenticate_admin, only: %i[new create destroy]
  before_action :authenticate_manager_or_admin, only: %i[edit update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "ユーザーの作成が合格しました."
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "ユーザーの更新が合格しました."
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: "ユーザーの削除が合格しました."
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
