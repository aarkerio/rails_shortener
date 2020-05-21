require 'rails_helper'

RSpec.describe "urls/edit", type: :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      ourl: "MyString",
      surl: "MyString",
      website: "MyString",
      visits: 1
    ))
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do

      assert_select "input[name=?]", "url[ourl]"

      assert_select "input[name=?]", "url[surl]"

      assert_select "input[name=?]", "url[website]"

      assert_select "input[name=?]", "url[visits]"
    end
  end
end
