class PermissionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @permissions = @user.permissions.order("action")
  end

  def new
    @user = User.find(params[:user_id])
    @permission = @user.permissions.build
  end

  def create
    @user = User.find(params[:user_id])
    @permission = @user.permissions.build(permission_params)

    if @permission.save
      redirect_to user_permissions_path, notice: "権限追加が合格しました。"
    else
      render :new
    end
  end

  def destroy
    Permission.find(params[:id]).destroy
    redirect_to user_permissions_path, notice: "権限の削除が合格しました。"
  end

  private

  def permission_params
    params.require(:permission).permit(:action)
  end
end
