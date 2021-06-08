module InvestorAuthentication
  private

  def authenticate_same_investor(investor_id)
    return if investor_id.to_i == session[:investor_id]
    
    redirect_to investors_path, alert: "該当の投資家のみがこの操作をできます。"
  end
end
