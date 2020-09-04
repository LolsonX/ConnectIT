require "swagger_helper"

describe "ConnectIT API Registration tests" do

  path "/users" do
    post "Registers user" do
      tags "Users"
      produces "application/json"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {type: :object, properties: {
            email: {type: :string},
            password: {type: :string},
            password_confirmation: {type: :string},
            description: {type: :string},
            birthdate: {type: :string, format: :date},
            website: {type: :string},
            location: {type: :string},
            name: {type: :string}
          }}
        },
        required: [:email, :password, :password_confirmation, :name, :birthdate]
      }

      response "201", "user created" do
        let(:user) do
          return {user: {
            email: Faker::Internet.email,
            password: "1234qwer",
            password_confirmation: "1234qwer",
            birthdate: Date.new(2000, 2, 3),
            name: Faker::Name.name
          }}
        end
        run_test!
      end

      response "422", "Invalid data" do
        let(:user) do
          {email: Faker::Internet.email,
           password: "",
           password_confirmation: "1234qwer",
           birthdate: Date.new(2000, 2, 3),
           name: Faker::Name.name}
        end
        run_test!
      end
    end
  end
end
