class MessagesController < ApplicationController
  before_action :authenticate_party, only: :show
  
  def sent
    @paginator = Paginator.new(current_user.sent_messages, params[:page])
    @messages = @paginator.items
  end

  def received
    @paginator = Paginator.new(current_user.received_messages, params[:page])
    @messages = @paginator.items
  end

  def show
    @message = Message.find(params[:id])
    return unless @message.receiver == current_user

    @message.read = true
    @message.save
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
