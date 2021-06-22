require 'rails_helper'

RSpec.describe Technology, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :technology
    include_examples "attributes present validations", :technology, %i[name]
  end
end
