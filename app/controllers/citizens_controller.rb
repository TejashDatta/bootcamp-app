class CitizensController < ApplicationController
  def index
    @path = citizens_path
    @search_params = search_params
    @citizens = Citizen.all
    @search_params.each do |column, value|
      @citizens = @citizens.where(column => value) if value.present?
    end
  end

  def index_vulnerable
    @path = index_vulnerable_citizens_path
    @search_params = search_params
    @citizens = Citizen.all
    @search_params.each do |column, value|
      @citizens = @citizens.where("#{column}='#{value}'") if value.present?
    end
    render :index
  end

  def show
    @citizen = Citizen.find_by(id: params[:id])
  end

  def show_vulnerable
    @citizen = Citizen.find_by("id='#{params[:id]}'")
    render :show
  end

  def new
    @citizen = Citizen.new
  end

  def edit
    @citizen = Citizen.find(params[:id])
    @form_action_path = citizen_path(@citizen)
  end

  def edit_vulnerable
    @citizen = Citizen.find(params[:id])
    @form_action_path = update_vulnerable_citizen_path(@citizen)
    render :edit
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

  def update_vulnerable
    Citizen.update_all(
      "name='#{citizen_params[:name]}', city='#{citizen_params[:city]}' WHERE id='#{params[:id]}'"
    )
    redirect_to Citizen.find(params[:id]), notice: "市民の更新が合格しました。"
  end

  def destroy
    Citizen.find(params[:id]).destroy
    redirect_to citizens_url, notice: "市民の削除が合格しました。"
  end

  private

  def citizen_params
    params.require(:citizen).permit(:name, :city)
  end

  def search_params
    params.permit(:name, :city).to_h.symbolize_keys
  end
end
