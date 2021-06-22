require "rails_helper"

RSpec.describe Message, type: :model do
  let(:message) { build(:message) }

  describe "validations" do
    include_examples "all attributes valid", :message
    include_examples "attributes present validations", :message, %i[sender receiver subject content]

    it "is invalid when subject is longer than 250 characters" do
      message.subject = "a" * 251
      expect(message).not_to be_valid
    end

    it "is invalid when content is longer than 2000 characters" do
      message.content = "a" * 2001
      expect(message).not_to be_valid
    end
  end
end
