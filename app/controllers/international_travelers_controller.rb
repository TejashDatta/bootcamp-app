class InternationalTravelersController < ApplicationController
  def index
    @international_travelers = InternationalTraveler.all
  end

  def show
    @international_traveler = InternationalTraveler.find(params[:id])
  end

  def new
    @international_traveler = InternationalTraveler.new
  end

  def edit
    @international_traveler = InternationalTraveler.find(params[:id])
  end

  def create
    @international_traveler = InternationalTraveler.new(international_traveler_params)

    if @international_traveler.save
      redirect_to @international_traveler, notice: "国際旅行者の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @international_traveler = InternationalTraveler.find(params[:id])

    if @international_traveler.update(international_traveler_params)
      redirect_to @international_traveler, notice: "国際旅行者の編集が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    InternationalTraveler.find(params[:id]).destroy
    redirect_to international_travelers_url, notice: "国際旅行者の削除が合格しました。"
  end

  private

  def international_traveler_params
    params.require(:international_traveler).permit(:name, :departure_country, :arrival_country)
  end
end
