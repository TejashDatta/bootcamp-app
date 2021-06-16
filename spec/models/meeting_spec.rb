require "rails_helper"

RSpec.describe Meeting, type: :model do
  let(:meeting) { build(:meeting) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(meeting).to be_valid
    end

    it "is invalid without name" do
      meeting.name = ""
      expect(meeting).not_to be_valid
    end

    it "is invalid without start_at" do
      meeting.start_at = nil
      expect(meeting).not_to be_valid
    end

    it "is invalid without end_at" do
      meeting.end_at = nil
      expect(meeting).not_to be_valid
    end

    it "is invalid when end_at is before start_at" do
      meeting = build(:meeting, start_at: 2.hours.from_now, end_at: 1.hour.from_now)
      expect(meeting).not_to be_valid
    end
  end

  describe "manager?" do
    it "specifies if given user is manager of meeting" do
      meeting.save
      expect(
        meeting.manager?(create(:meeting_participation, meeting: meeting, manager: true).user)
      ).to be_truthy
    end
  end
end
