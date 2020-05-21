require 'rails_helper'

RSpec.describe "kkrls/new", type: :view do
  before(:each) do
    assign(:kkrl, Kkrl.new(
      ourl: "MyString",
      surl: "MyString",
      website: "MyString",
      visits: 1
    ))
  end

  it "renders new kkrl form" do
    render

    assert_select "form[action=?][method=?]", kkrls_path, "post" do

      assert_select "input[name=?]", "kkrl[ourl]"

      assert_select "input[name=?]", "kkrl[surl]"

      assert_select "input[name=?]", "kkrl[website]"

      assert_select "input[name=?]", "kkrl[visits]"
    end
  end
end
