 require 'rails_helper'

RSpec.describe "/messages", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "messages" }
  
  let(:valid_attributes) do
    {
      receiver_id: create(:user).id,
      subject: "Hello",
      content: "How are you?"
    }
  end

  let(:invalid_attributes) do
    {
      receiver_id: nil
    }
  end

  let(:message) { create(:message, sender: authorized_user, receiver: authorized_user) }

  describe "GET /sent" do
    it "renders a successful response" do
      message
      get sent_messages_url
      expect(response).to be_successful
    end
  end

  describe "GET /received" do
    it "renders a successful response" do
      message
      get received_messages_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get message_url(message)
      expect(response).to be_successful
    end

    it "changes message status to read" do
      get message_url(message)
      message.reload
      expect(message.read).to be true
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_message_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Message" do
        expect {
          post messages_url, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post messages_url, params: { message: valid_attributes }
        expect(response).to redirect_to(message_url(Message.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Message" do
        expect {
          post messages_url, params: { message: invalid_attributes }
        }.to change(Message, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post messages_url, params: { message: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
