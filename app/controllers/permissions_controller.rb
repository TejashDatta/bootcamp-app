class PermissionsController < ApplicationController
  before_action -> { authenticate_same_user params[:user_id] }
  
  def show
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    @user.permit_actions(params[:actions])
    flash.notice = t("flash_messages.update_success", model: Permission.model_name.human)
    render :show
  end
end
