class UsersController < ApplicationController
  before_action -> { authenticate_same_user params[:id] }, only: %i[show edit update destroy]

  def index
    @paginator = Paginator.new(User.all, params[:page])
    @users = @paginator.items
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
      redirect_to @user, notice: t("flash_messages.create_success", model: User.model_name.human)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: t("flash_messages.update_success", model: User.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: t("flash_messages.destroy_success", model: User.model_name.human)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
