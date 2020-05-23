require "rails_helper"

RSpec.describe UrlsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/urls").to route_to("urls#index")
    end

    it "routes to #show" do
      expect(get: "/urls/B").to route_to("urls#show", url: "B")
    end


    it "routes to #create" do
      expect(post: "/urls").to route_to("urls#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/urls/1").to route_to("urls#update", id: "1")
    end
  end
end
