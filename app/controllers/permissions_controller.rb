class PermissionsController < ApplicationController
  before_action -> { authenticate_same_user params[:user_id] }
  
  def show
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    @user.permit_actions(params[:actions])
    flash.notice = "権限更新が合格しました。"
    render :show
  end
end
