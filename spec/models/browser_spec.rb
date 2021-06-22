require "rails_helper"

RSpec.describe Browser, type: :model do
  let(:browser) { build(:browser) }

  describe "validations" do
    it "is valid when all attributes are valid" do
      expect(browser).to be_valid
    end

    include_examples "attributes present validations", :browser, %i[name developer]
  end
end
