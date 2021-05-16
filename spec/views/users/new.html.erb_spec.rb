require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) { assign(:user, build(:user)) }

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"
    end
  end
end
