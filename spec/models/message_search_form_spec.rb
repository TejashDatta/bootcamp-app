require "rails_helper"

RSpec.describe MessageSearchForm do
  let(:user) { create(:user) }

  describe "#search" do
    shared_examples "returns a search result" do
      it "returns a search result" do
        expect(MessageSearchForm.new(user: user, params: search_params).search.size).to eq 1
      end
    end

    context "searching with sender_email" do
      let(:sender) { create(:user) }
      let(:search_params) { { sender_email: sender.email } }
      before { create(:message, sender: sender, receiver: user) }

      include_examples "returns a search result"
    end

    context "searching with receiver_email" do
      let(:receiver) { create(:user) }
      let(:search_params) { { receiver_email: receiver.email } }
      before { create(:message, sender: user, receiver: receiver) }

      include_examples "returns a search result"
    end

    context "searching with subject" do
      let(:search_params) { { subject: "example" } }
      before { create(:message, sender: user, subject: "example subject") }

      include_examples "returns a search result"
    end

    context "searching with content" do
      let(:search_params) { { content: "example" } }
      before { create(:message, sender: user, content: "example content") }

      include_examples "returns a search result"
    end
  end
end
