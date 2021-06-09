class CitizensController < ApplicationController
  def index
    @citizens = Citizen.all
  end

  def show
    @citizen = Citizen.find(params[:id])
  end

  def new
    @citizen = Citizen.new
  end

  def edit
    @citizen = Citizen.find(params[:id])
  end

  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      redirect_to @citizen, notice: "市民の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @citizen = Citizen.find(params[:id])
    
    if @citizen.update(citizen_params)
      redirect_to @citizen, notice: "市民の更新が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Citizen.find(params[:id]).destroy
    redirect_to citizens_url, notice: "市民の削除が合格しました。"
  end

  def citizens_in_city_vulnerable
    @citizens = Citizen.where("city = '#{params[:city]}'")
    render :index
  end

  def citizens_in_city_secure
    @citizens = Citizen.where(city: params[:city])
    render :index
  end

  private

  def citizen_params
    params.require(:citizen).permit(:name, :city)
  end
end
