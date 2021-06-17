class MessagesController < ApplicationController
  before_action :authenticate_party, only: :show
  
  def sent
    @messages = current_user.sent_messages
  end

  def received
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.new(message_params)

    if @message.save
      redirect_to @message, notice: "メッセージを送りました。"
    else
      render :new
    end
  end


  private

  def message_params
    params.require(:message).permit(:receiver_id, :subject, :content)
  end

  def authenticate_party
    return if Message.find(params[:id]).party? current_user

    redirect_back fallback_location: login_path, alert: "このメッセージを見る権限がありません。"
  end
end
