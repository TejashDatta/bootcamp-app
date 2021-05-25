class HealthInformationController < ApplicationController
  def index
    @health_information = HealthInformation.all
  end

  def show
    @health_information = HealthInformation.find(params[:id])
  end

  def new
    @health_information = HealthInformation.new
  end

  def edit
    @health_information = HealthInformation.find(params[:id])
  end

  def create
    @health_information = HealthInformation.new(health_information_params)

    if @health_information.save
      redirect_to @health_information, notice: "健康情報の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @health_information = HealthInformation.find(params[:id])

    if @health_information.update(health_information_params)
      redirect_to @health_information, notice: "健康情報の編集が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    HealthInformation.find(params[:id]).destroy
    redirect_to health_information_index_url, notice: "健康情報の削除が合格しました。"
  end

  private
  
  def health_information_params
    params.require(:health_information).permit(:user_id, :height_in_cm, :weight_in_kg)
  end
end
