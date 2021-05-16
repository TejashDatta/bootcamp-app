require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) { assign(:user, create(:user)) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/name-/)
    expect(rendered).to match(/email-/)
  end
end
