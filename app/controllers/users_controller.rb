class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = find_user(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = find_user(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  def update
    @user = find_user(params[:id])
    
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    find_user(params[:id]).destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def find_user(id)
    User.find(id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
