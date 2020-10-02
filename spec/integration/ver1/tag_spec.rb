require "swagger_helper"

describe "ConnectIT tags integration tests" do
  path "/ver1/tags" do
    post "Create a new tag" do
    end
    get "Get tags list" do
    end
  end
  path "/ver1/tags/{id}" do
    get "Get a tag" do
    end

    delete "Remove a tag" do
    end
  end
end
