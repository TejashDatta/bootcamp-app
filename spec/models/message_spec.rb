require "rails_helper"

RSpec.describe Message, type: :model do
  let(:message) { build(:message) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(message).to be_valid
    end

    it "is invalid without sender" do
      message.sender = nil
      expect(message).not_to be_valid
    end

    it "is invalid without receiver" do
      message.receiver = nil
      expect(message).not_to be_valid
    end

    it "is invalid without subject" do
      message.subject = nil
      expect(message).not_to be_valid
    end

    it "is invalid when subject is longer than 250 characters" do
      message.subject = "a" * 251
      expect(message).not_to be_valid
    end

    it "is invalid without content" do
      message.content = nil
      expect(message).not_to be_valid
    end

    it "is invalid when content is longer than 2000 characters" do
      message.content = "a" * 2001
      expect(message).not_to be_valid
    end
  end
end
