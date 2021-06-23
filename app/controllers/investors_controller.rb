class InvestorsController < ApplicationController
  include InvestorAuthentication
  
  before_action -> { authenticate_investor_account_user params[:id] }, only: %i[show edit update destroy]
  
  def index
    @investors = Investor.all
  end

  def show
    @investor = Investor.find(params[:id])
  end

  def new
    @investor = current_user.investor_accounts.build
  end

  def edit
    @investor = Investor.find(params[:id])
  end

  def create
    @investor = current_user.investor_accounts.build(investor_params)

    if @investor.save
      session[:investor_id] = @investor.id
      redirect_to @investor,
                  notice: t("flash_messages.create_success", model: Investor.model_name.human)
    else
      render :new
    end
  end

  def update
    @investor = Investor.find(params[:id])

    if @investor.update(investor_params)
      redirect_to @investor,
                  notice: t("flash_messages.update_success", model: Investor.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    Investor.find(params[:id]).destroy
    redirect_to investors_url,
                notice: t("flash_messages.destroy_success", model: Investor.model_name.human)
  end

  private

  def investor_params
    params.require(:investor).permit(:account_number, :balance_in_yen)
  end
end
