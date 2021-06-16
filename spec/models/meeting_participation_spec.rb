require "rails_helper"

RSpec.describe MeetingParticipation, type: :model do
  let(:meeting_participation) { build(:meeting_participation) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(meeting_participation).to be_valid
    end

    it "is invalid without meeting" do
      meeting_participation.meeting = nil
      expect(meeting_participation).not_to be_valid
    end

    it "is invalid without user" do
      meeting_participation.user = nil
      expect(meeting_participation).not_to be_valid
    end
  end
end
