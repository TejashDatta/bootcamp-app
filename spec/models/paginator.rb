require "rails_helper"

RSpec.describe Paginator, type: :model do
  let(:paginator) do
    create_list(:user, 25)
    Paginator.new(User.all, "2", per_page: 10)
  end
  
  describe "#page_from_param" do
    it "returns 1 when no page parameter" do
      expect(paginator.page_from_param(nil)).to eq(1)
    end

    it "converts page parameter string to integer" do
      expect(paginator.page_from_param("2")).to eq(2)
    end
  end
  
  describe "#last_page" do
    it "returns the last page" do
      expect(paginator.last_page).to eq(3)
    end
  end

  describe "#items" do
    it "returns list of items of model" do
      expect(paginator.items).to all(be_a(User))
    end

    it "has number of items less than or equal to as described by per_page" do
      expect(paginator.items.length).to be <= 10
    end
  end
end
