require "rails_helper"

RSpec.describe Browser, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :browser
    include_examples "attributes present validations", :browser, %i[name developer]
  end
end
