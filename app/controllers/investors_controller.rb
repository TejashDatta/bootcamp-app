class InvestorsController < ApplicationController
  def index
    @investors = Investor.all
  end

  def show
    @investor = Investor.find(params[:id])
  end

  def new
    @investor = Investor.new
  end

  def edit
    @investor = Investor.find(params[:id])
  end

  def create
    @investor = Investor.new(investor_params)

    if @investor.save
      redirect_to @investor, notice: "投資家の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @investor = Investor.find(params[:id])

    if @investor.update(investor_params)
      redirect_to @investor, notice: "投資家の更新が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Investor.find(params[:id]).destroy
    redirect_to investors_url, notice: "投資家の削除が合格しました。"
  end

  private

  def investor_params
    params.require(:investor).permit(:account_number, :balance_in_yen)
  end
end
