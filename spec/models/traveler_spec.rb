require "rails_helper"

RSpec.describe Traveler, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :traveler
    include_examples "attributes present validations", :traveler,
                     %i[name departure_country arrival_country]
  end
end
