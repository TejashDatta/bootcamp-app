class MessagesController < ApplicationController
  before_action :authenticate_party, only: :show

  def sent
    @message_search_form = MessageSearchForm.new
    @paginator = Paginator.new(current_user.sent_messages, params[:page])
    @messages = @paginator.items
  end

  def received
    @message_search_form = MessageSearchForm.new
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
      redirect_to @message,
                  notice: t("flash_messages.message_sent")
    else
      render :new
    end
  end

  def search
    @message_search_params = { message_search_form: search_params }
    @message_search_form = MessageSearchForm.new(user: current_user, params: search_params)
    @paginator = Paginator.new(@message_search_form.search, params[:page])
    @messages = @paginator.items
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :subject, :content)
  end

  def search_params
    params.require(:message_search_form).permit(:sender_email, :receiver_email, :subject, :content)
  end

  def authenticate_party
    return if Message.find(params[:id]).party? current_user

    redirect_back fallback_location: login_path,
                  alert: t("flash_messages.authenticate_message_party_failure")
  end
end
