class StockInvestmentsController < ApplicationController
  def index
    @investor = Investor.find(params[:investor_id])
    @stock_investments = @investor.stock_investments
  end

  def show
    @stock_investment = StockInvestment.find(params[:id])
  end

  def new
    @stock_investment = Investor.find(params[:investor_id]).stock_investments.build
  end

  def edit
    @stock_investment = StockInvestment.find(params[:id])
  end

  def create
    @stock_investment = Investor.find(params[:investor_id]).stock_investments.build(stock_investment_params)

    if @stock_investment.save
      redirect_to investor_stock_investment_path(@stock_investment.investor, @stock_investment), notice: "株式投資の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @stock_investment = StockInvestment.find(params[:id])

    if @stock_investment.update(stock_investment_params)
      redirect_to investor_stock_investment_path(@stock_investment.investor, @stock_investment), notice: "株式投資の作成が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    StockInvestment.find(params[:id]).destroy
    redirect_to investor_stock_investments_url, notice: "株式投資の作成が合格しました。"
  end

  private
  
  def stock_investment_params
    params.require(:stock_investment).permit(:stock_name, :shares_owned)
  end
end
