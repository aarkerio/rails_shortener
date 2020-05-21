require 'rails_helper'

RSpec.describe "kkrls/edit", type: :view do
  before(:each) do
    @kkrl = assign(:kkrl, Kkrl.create!(
      ourl: "MyString",
      surl: "MyString",
      website: "MyString",
      visits: 1
    ))
  end

  it "renders the edit kkrl form" do
    render

    assert_select "form[action=?][method=?]", kkrl_path(@kkrl), "post" do

      assert_select "input[name=?]", "kkrl[ourl]"

      assert_select "input[name=?]", "kkrl[surl]"

      assert_select "input[name=?]", "kkrl[website]"

      assert_select "input[name=?]", "kkrl[visits]"
    end
  end
end
