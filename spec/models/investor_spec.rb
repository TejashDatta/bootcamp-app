require "rails_helper"

RSpec.describe Investor, type: :model do
  let(:investor) { build(:investor) }

  describe "validations" do
    include_examples "all attributes valid", :investor
    include_examples "attributes present validations", :investor, %i[account_number]
    include_examples "attribute non-negative validation", :investor, :balance_in_yen
  end
end
