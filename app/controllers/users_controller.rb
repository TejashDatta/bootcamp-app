class UsersController < ApplicationController
  def index
    per_page = 10
    @page = params[:page].nil? ? 1 : params[:page].to_i
    @last_page = User.count.zero? ? 1 : (User.count - 1) / per_page + 1
    @users = User.all.limit(per_page).offset((@page - 1) * per_page)
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
      redirect_to @user, notice: "ユーザーの作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "ユーザーの更新が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: "ユーザーの削除が合格しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
