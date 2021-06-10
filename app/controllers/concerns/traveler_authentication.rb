module TravelerAuthentication
  private
  
  def authenticate_traveler_account_user(traveler_id)
    return if Traveler.find(traveler_id).account_user == current_user

    redirect_to travelers_path, alert: "アカウント連携のユーザーのみがこの操作をできます。"
  end
end
