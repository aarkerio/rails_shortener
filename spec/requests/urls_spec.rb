 require 'rails_helper'

RSpec.describe "/urls", type: :request do

  let!(:url_1)  { FactoryBot.attributes_for :url }

  describe "GET /" do
    it "renders a successful response" do
      get "/"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      url = Url.create! url_1
      get url_show_path url.shorted_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Url" do
           Rails.logger.info " >>>>  URL >>>  #{url_1.inspect}"
        expect {
          post urls_url, params: {url: url_1}
        }.to change(Url, :count).by(1)
      end

      it "redirects to the created url" do
        post urls_url, params: {url: url_1 }
        expect(response).to redirect_to(url_url(Url.last.shorted_url))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Url" do
        expect {
          post urls_url, params: {url: {original_url: "ht/77://invalid"}}
        }.to change(Url, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post urls_url, params: {url: {original_url: "ht/77://invalid"}}
        expect(response).to be_successful
      end
    end
  end
 end
