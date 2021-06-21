require "rails_helper"

RSpec.describe MessageSearchForm do
  let(:user) { create(:user) }

  describe "#search" do
    it "searches for messages with sender email" do
      sender = create(:user)
      create(:message, sender: sender, receiver: user)
      expect(MessageSearchForm.new(user: user, params: { sender_email: sender.email }).search.size).to eq 1
    end

    it "searches for messages with receiver email" do
      receiver = create(:user)
      create(:message, sender: user, receiver: receiver)
      expect(MessageSearchForm.new(user: user, params: { receiver_email: receiver.email }).search.size).to eq 1
    end

    it "searches for messages with subject" do
      create(:message, sender: user, subject: "example subject")
      expect(MessageSearchForm.new(user: user, params: { subject: "example" }).search.size).to eq 1
    end

    it "searches for messages with content" do
      create(:message, sender: user, content: "example content")
      expect(MessageSearchForm.new(user: user, params: { content: "example" }).search.size).to eq 1
    end
  end
end
