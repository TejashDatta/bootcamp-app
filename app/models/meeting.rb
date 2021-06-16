class Meeting < ApplicationRecord
  has_many :meeting_participations
  has_many :participants, class_name: "User", through: :meeting_participations

  validates_presence_of :name, :start_at, :end_at
  validate :start_at_should_be_before_end_at

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    errors.add(:start_at, "は終了より前に設定してください") if start_at >= end_at
  end

  def manager?(user)
    MeetingParticipation.find_by(meeting: self, user: user, manager: true)
  end
end
