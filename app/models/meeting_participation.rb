class MeetingParticipation < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  validates_presence_of :meeting, :user
end
