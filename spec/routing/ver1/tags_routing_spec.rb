require "rails_helper"

RSpec.describe Ver1::TagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ver1/tags").to route_to("ver1/tags#index")
    end

    it "routes to #show" do
      expect(get: "/ver1/tags/1").to route_to("ver1/tags#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ver1/tags").to route_to("ver1/tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ver1/tags/1").to route_to("ver1/tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ver1/tags/1").to route_to("ver1/tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ver1/tags/1").to route_to("ver1/tags#destroy", id: "1")
    end
  end
end
