require 'rails_helper'

RSpec.describe "urls/new", type: :view do
  before(:each) do
    assign(:url, Url.new(
      ourl: "MyString",
      surl: "MyString",
      website: "MyString",
      visits: 1
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input[name=?]", "url[ourl]"

      assert_select "input[name=?]", "url[surl]"

      assert_select "input[name=?]", "url[website]"

      assert_select "input[name=?]", "url[visits]"
    end
  end
end
