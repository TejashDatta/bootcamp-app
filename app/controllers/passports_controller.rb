class PassportsController < ApplicationController
  before_action :verify_traveler
  
  def show
    @passport = Traveler.find(params[:traveler_id]).passport
  end

  def new
    @passport = Traveler.find(params[:traveler_id]).build_passport
  end

  def edit
    @passport = Traveler.find(params[:traveler_id]).passport
  end

  def create
    @passport = Traveler.find(params[:traveler_id]).build_passport(passport_params)

    if @passport.save
      redirect_to traveler_passport_path,
                  notice: t("flash_messages.create_success", model: Passport.model_name.human)
    else
      render :new
    end
  end

  def update
    @passport = Traveler.find(params[:traveler_id]).passport

    if @passport.update(passport_params)
      redirect_to traveler_passport_path,
                  notice: t("flash_messages.update_success", model: Passport.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    Traveler.find(params[:traveler_id]).passport.destroy
    redirect_to travelers_path,
                notice: t("flash_messages.destroy_success", model: Passport.model_name.human)
  end

  private

  def passport_params
    params.require(:passport).permit(:passport_number, :nationality)
  end

  def verify_traveler
    return if Traveler.find_by(id: params[:traveler_id])

    redirect_to travelers_path, alert: t("owner_model_does_not_exist", model: Traveler.model_name.human)
  end
end
