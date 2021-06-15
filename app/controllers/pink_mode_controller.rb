class PinkModeController < ApplicationController
  def toggle
    session[:pink_mode] = !session[:pink_mode]
    redirect_back fallback_location: root_path
  end
end
