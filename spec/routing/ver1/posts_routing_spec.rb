require "rails_helper"

RSpec.describe Ver1::PostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ver1/posts").to route_to("ver1/posts#index")
    end

    it "routes to #show" do
      expect(get: "/ver1/posts/1").to route_to("ver1/posts#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ver1/posts").to route_to("ver1/posts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ver1/posts/1").to route_to("ver1/posts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ver1/posts/1").to route_to("ver1/posts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ver1/posts/1").to route_to("ver1/posts#destroy", id: "1")
    end
  end
end
