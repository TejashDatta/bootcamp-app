class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def show
    @technology = Technology.find(params[:id])
  end

  def new
    @technology = Technology.new
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to @technology, notice: "技術の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @technology = Technology.find(params[:id])

    if @technology.update(technology_params)
      redirect_to @technology, notice: "技術の作成が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Technology.find(params[:id]).destroy
    redirect_to technologies_url, notice: "技術の作成が合格しました。"
  end

  private

  def technology_params
    params.require(:technology).permit(:name)
  end
end
