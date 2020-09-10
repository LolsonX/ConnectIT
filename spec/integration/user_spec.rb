require "swagger_helper"
require "warden"

describe "ConnectIT API Registration tests" do
  path "/users" do
    post "Registers user" do
      tags "Users"
      produces "application/json"
      consumes "application/json"
      parameter name: :email,
                in: :user,
                required: true,
                type: :string
      parameter name: :password,
                in: :user,
                required: true,
                type: :string
      parameter name: :password_confirmation,
                in: :user,
                required: true,
                type: :string
      parameter name: :name,
                in: :user,
                required: true,
                type: :string
      parameter name: :description,
                in: :user,
                required: false,
                type: :string
      parameter name: :birthdate,
                in: :user,
                required: false,
                type: :string,
                format: :date
      parameter name: :website,
                in: :user,
                required: false,
                type: :string
      parameter name: :location,
                in: :user,
                required: false,
                type: :string
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
        }
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
    patch "Edit user" do
      tags "Users"
      produces "application/json"
      consumes "application/json"
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :current_password,
                in: :user,
                required: true,
                type: :string

      parameter name: :user, in: :body, type: :object, schema: {
        type: :object,
        properties: {
          user: {type: :object, properties: {
            current_password: {type: :string},
            password: {type: :string},
            description: {type: :string},
            website: {type: :string},
            location: {type: :string}
          }}
        }
      }
      response "204", "Updated" do
        let(:user) do
          return {user: {
            email: "example1@example.com",
            current_password: "1234qwer",
            birthdate: Date.new(2000, 2, 3),
            name: "New Name",
            website: "http://myweb.com",
            location: "Poland",
            description: "My description"
          }}
        end
        let(:Authorization) do
          User.create! email: "example@example.com",
                       password: "1234qwer",
                       password_confirmation: "1234qwer",
                       birthdate: Date.new(2000, 2, 1),
                       name: Faker::Name.name
          post("/users/sign_in/", params: {user: {
            email: "example@example.com",
            password: "1234qwer"
          }},
                                  as: :json)
          @response["Authorization"]
        end
        run_test! do |response|
          user = User.find_by email: "example@example.com"
          expect(user).not_to be_nil
          expect(user.name).not_to eq("New Name")
          expect(user.description).to eq("My description")
          expect(user.location).to eq("Poland")
          expect(user.website).to eq("http://myweb.com")
          expect(user.birthdate).to eq(Date.new(2000, 2, 3))
        end
      end
      response "401", "Not authorized" do
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
        let(:Authorization) { "blalbla" }
        run_test!
      end
    end
  end

  path "/users/sign_in" do
    post "Login user" do
      tags "Users"
      produces "application/json"
      consumes "application/json"
      parameter name: :email,
                in: :user,
                required: true,
                type: :string
      parameter name: :password,
                in: :user,
                required: true,
                type: :string
      parameter name: :user, description: "User Object", in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: {type: :string},
              password: {type: :string}
            },
            required: [:email, :password]
          },
          required: [:user]
        }
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
