class PassportsController < ApplicationController
  include TravelerAuthentication
  
  before_action -> { authenticate_traveler_account_user params[:traveler_id] }

  def show
    @passport = Passport.find_by(traveler_id: params[:traveler_id])
  end

  def new
    @passport = Traveler.find(params[:traveler_id]).build_passport
  end

  def edit
    @passport = Passport.find_by(traveler_id: params[:traveler_id])
  end

  def create
    @passport = Traveler.find(params[:traveler_id]).build_passport(passport_params)

    if @passport.save
      redirect_to traveler_passport_path, notice: "パスポートの作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @passport = Passport.find_by(traveler_id: params[:traveler_id])

    if @passport.update(passport_params)
      redirect_to traveler_passport_path, notice: "パスポートの更新が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Passport.find_by(traveler_id: params[:traveler_id]).destroy
    redirect_to travelers_path, notice: "パスポートの削除が合格しました。"
  end

  private

  def passport_params
    params.require(:passport).permit(:passport_number, :nationality)
  end
end
