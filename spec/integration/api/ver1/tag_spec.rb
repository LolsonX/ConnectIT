require "swagger_helper"

describe "ConnectIT Tag integration tests" do
  path "/api/ver1/tags" do
    post "Creates a new tag" do
      tags "Tags"
      produces "application/json"
      consumes "application/json"
      parameter name: :name, in: :tag, required: true, type: :string
      parameter name: :tag, in: :body, schema: {
        type: :object,
        properties: {
          name: :string
        }
      }
      response "201", "Created new tag" do
        let(:tag) { {name: "New Tag Name"} }
        run_test! do |response|
          parsed_response = JSON.parse(response)["tag"]
          expect(parsed_response["name"]).to eq "New Tag Name"
          expect(parsed_response["id"]).not_to be_falsey
        end
      end

      response "422", "Tag not created" do
        let(:tag) do
          Tag.create(name: "New Tag Name")
          {name: "New Tag Name"}
        end
        run_test!
      end
    end
    get "Get list of available tags" do
      tags "Tags"
      produces "application/json"
      consumes "application/json"
      response "200", "Retrieved list" do
        schema type: :object,
               properties: {
                 tags: :array, items: {
                   type: :object,
                   properties: {id: :integer, name: :string}
                 }
               }
        run_test!
      end
    end
  end
  path "/api/ver1/tag/{id}" do
    get "Retrieve tag" do
      tags "Tags"
      produces "application/json"
      consumes "application/json"
      parameter name: :id, in: :path, type: :string, required: true

      response "200", "Tag found" do
        let(:id) { Tag.create(name: "SimpleTag").id }
        run_test!
      end

      response "404", "Tag not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
    delete "Remove tag" do
      tags "Tags"
      produces "application/json"
      consumes "application/json"
      parameter name: :id, in: :path, type: :string, required: true

      response "200", "Tag removed" do
        let(:id) { Tag.create(name: "SimpleTag").id }
        run_test! do
          expect(Tag.count).to be_eq 0
        end
      end

      response "404", "Tag not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
  end
end
