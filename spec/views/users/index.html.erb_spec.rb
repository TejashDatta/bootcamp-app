require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) { assign(:users, create_list(:user, 2)) }

  it "renders a list of users" do
    render
    # assert_select "tr>td", text: "Name".to_s, count: 2
    # assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
