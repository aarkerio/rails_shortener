require "rails_helper"

RSpec.describe KkrlsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/kkrls").to route_to("kkrls#index")
    end

    it "routes to #new" do
      expect(get: "/kkrls/new").to route_to("kkrls#new")
    end

    it "routes to #show" do
      expect(get: "/kkrls/1").to route_to("kkrls#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/kkrls/1/edit").to route_to("kkrls#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/kkrls").to route_to("kkrls#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/kkrls/1").to route_to("kkrls#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/kkrls/1").to route_to("kkrls#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/kkrls/1").to route_to("kkrls#destroy", id: "1")
    end
  end
end
