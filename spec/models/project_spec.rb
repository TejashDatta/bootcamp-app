require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    include_examples "all attributes valid", :project
    include_examples "attributes present validations", :project, %i[name]
  end
end
