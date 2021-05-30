class PermissionsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    User.transaction do
      @user.permissions.clear
      params[:actions].each do |action|
        @user.permissions.create(action: action)
      end
    end
    flash.notice = "権限更新が合格しました。"
    render :show
  end
end
