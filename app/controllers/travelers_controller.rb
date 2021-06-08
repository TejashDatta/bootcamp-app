class TravelersController < ApplicationController
  include TravelerAuthentication
  
  before_action -> { authenticate_same_traveler params[:id] }, only: %i[show edit update destroy]
  
  def index
    @paginator = Paginator.new(Traveler.all, params[:page])
    @travelers = @paginator.items
  end

  def show
    @traveler = Traveler.find(params[:id])
  end

  def new
    @traveler = Traveler.new
  end

  def edit
    @traveler = Traveler.find(params[:id])
  end

  def create
    @traveler = Traveler.new(traveler_params)

    if @traveler.save
      session[:traveler_id] = @traveler.id
      redirect_to @traveler, notice: "国際旅行者の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @traveler = Traveler.find(params[:id])

    if @traveler.update(traveler_params)
      redirect_to @traveler, notice: "国際旅行者の編集が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Traveler.find(params[:id]).destroy
    redirect_to travelers_url, notice: "国際旅行者の削除が合格しました。"
  end

  def login
    traveler = Traveler.find(params[:id])
    session[:traveler_id] = traveler.id
    redirect_to travelers_url, notice: "#{traveler.name}としてログインしました。"
  end

  private

  def traveler_params
    params.require(:traveler).permit(:name, :departure_country, :arrival_country)
  end
end
