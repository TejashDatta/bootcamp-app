module InvestorAuthentication
  private

  def authenticate_investor_account_user(investor_id)
    return if Investor.find(investor_id).account_user == current_user

    redirect_to investors_path, alert: "アカウント連携のユーザーのみがこの操作をできます。"
  end
end
