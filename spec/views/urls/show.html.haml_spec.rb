require 'rails_helper'

RSpec.describe "urls/show", type: :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      ourl: "Ourl",
      surl: "Surl",
      website: "Website",
      visits: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ourl/)
    expect(rendered).to match(/Surl/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/2/)
  end
end
