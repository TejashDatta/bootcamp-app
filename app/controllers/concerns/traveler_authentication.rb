module TravelerAuthentication
  private
  
  def authenticate_traveler_account_user(traveler_id)
    return if Traveler.find(traveler_id).account_user == current_user

    redirect_to travelers_path, alert: t("flash_messages.authenticate_linked_user_failure")
  end
end
