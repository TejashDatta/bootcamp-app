require "rails_helper"

RSpec.describe Message, type: :model do
  let(:message) { build(:message) }

  describe "validations" do
    include_examples "all attributes valid", :message
    include_examples "attributes present validations", :message, %i[sender receiver subject content]
    include_examples "attribute length validation", :message, :subject, 250
    include_examples "attribute length validation", :message, :content, 2000
  end
end
