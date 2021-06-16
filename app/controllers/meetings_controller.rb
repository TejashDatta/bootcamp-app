class MeetingsController < ApplicationController
  before_action :authenticate_manager, only: %i[edit update destroy]
  before_action :authenticate_participant, only: :show
  
  def index
    @meetings = current_user.meetings
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(meeting_params)

    transaction do
      if @meeting.save
        MeetingParticipation.new({ meeting: @meeting, user: current_user, manager: true }).save
      end
    end

    if @meeting.errors
      render :new
    else
      redirect_to @meeting, notice: "会議の作成が合格しました。"
    end
  end

  def update
    @meeting = Meeting.find(params[:id])

    if @meeting.update(meeting_params)
      redirect_to @meeting, notice: "会議の作成が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Meeting.find(params[:id]).destroy
    redirect_to meetings_url, notice: "会議の作成が合格しました。"
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :start_at, :end_at)
  end

  def authenticate_manager
    return unless Meeting.find(params[:id]).manager? current_user

    redirect_back fallback_location: login_path, alert: "会議の管理人のみがこの操作をできます。"
  end

  def authenticate_participant
    return unless Meeting.find(params[:id]).participants.exists? current_user

    redirect_back fallback_location: login_path, alert: "会議の参加者のみがこの操作をできます。"
  end
end
