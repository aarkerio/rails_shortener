require 'rails_helper'

RSpec.describe "kkrls/index", type: :view do
  before(:each) do
    assign(:kkrls, [
      Kkrl.create!(
        ourl: "Ourl",
        surl: "Surl",
        website: "Website",
        visits: 2
      ),
      Kkrl.create!(
        ourl: "Ourl",
        surl: "Surl",
        website: "Website",
        visits: 2
      )
    ])
  end

  it "renders a list of kkrls" do
    render
    assert_select "tr>td", text: "Ourl".to_s, count: 2
    assert_select "tr>td", text: "Surl".to_s, count: 2
    assert_select "tr>td", text: "Website".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
