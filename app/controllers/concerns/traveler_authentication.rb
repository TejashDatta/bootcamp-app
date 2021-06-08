module TravelerAuthentication
  private
  
  def authenticate_same_traveler(traveler_id)
    return if traveler_id.to_i == session[:traveler_id]
    
    redirect_to travelers_path, alert: "該当の旅行者のみがこの操作をできます。"
  end
end
