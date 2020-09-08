require "swagger_helper"
require "warden"

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
            name: Faker::Name.name,
            website: "http://myweb.com",
            location: "Poland",
            description: "My description"
          }}
        end
        run_test! do |response|
          expect(JSON.parse(response.body)["name"]).not_to be_falsey
          expect(JSON.parse(response.body)["birthdate"]).not_to be_falsey
          expect(JSON.parse(response.body)["website"]).not_to be_falsey
          expect(JSON.parse(response.body)["location"]).not_to be_falsey
          expect(JSON.parse(response.body)["description"]).not_to be_falsey
        end
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

  path "/users/sign_in" do
    post "Login user" do
      tags "Users"
      produces "application/json"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {type: :object, properties: {
            email: {type: :string},
            password: {type: :string}
          }}
        },
        required: [:email, :password]
      }
      response "201", "Logged in" do
        let(:user) do
          User.create! email: "example@example.com",
                       password: "1234qwer",
                       password_confirmation: "1234qwer",
                       birthdate: Date.new(2000, 2, 3),
                       name: Faker::Name.name
          return {user: {
            email: "example@example.com",
            password: "1234qwer"
          }}
        end
        run_test! do |response|
          expect(response.headers["Authorization"]).not_to be_falsey
        end
      end
      response "401", "Invalid credentials" do
        let(:user) do
          User.create! email: "example@example.com",
                       password: "1234qwer",
                       password_confirmation: "1234qwer",
                       birthdate: Date.new(2000, 2, 3),
                       name: Faker::Name.name
          return {user: {
            email: "example@example.com",
            password: "123qwer"
          }}
        end
        run_test! do |response|
          expect(response.headers["Authorization"]).to be_falsey
        end
      end
    end
  end
end
