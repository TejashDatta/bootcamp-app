class TravelersController < ApplicationController
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
      redirect_to @traveler,
                  notice: t("flash_messages.create_success", model: Traveler.model_name.human)
    else
      render :new
    end
  end

  def update
    @traveler = Traveler.find(params[:id])

    if @traveler.update(traveler_params)
      redirect_to @traveler,
                  notice: t("flash_messages.update_success", model: Traveler.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    Traveler.find(params[:id]).destroy
    redirect_to travelers_url,
                notice: t("flash_messages.destroy_success", model: Traveler.model_name.human)
  end

  private

  def traveler_params
    params.require(:traveler).permit(:name, :departure_country, :arrival_country)
  end
end
