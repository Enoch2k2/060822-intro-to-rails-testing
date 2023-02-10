require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "index action" do
    it "returns the array of users" do
      User.create(first_name: "Bob", last_name: "Smith", email: "Bob@smith.com", password: "testtest")
      get :index

      expect(JSON.parse(response.body).length).to eq(User.all.length)
    end

    it "has status of 200" do
      expect(response.status).to eq(200)
    end
  end

  context "create action" do
    it "creates a user with the given params and renders the json" do
      post :create, params: { first_name: "Bob", last_name: "Not Smith", email: "test@test.com", password: "testtesttest" }

      user = JSON.parse(response.body)
      email = user["email"]

      expect(User.all.length).to eq(1)
      expect(email).to eq("test@test.com")

    end

    it "returns status 201" do
      post :create, params: { first_name: "Bob", last_name: "Not Smith", email: "test@test.com", password: "testtesttest" }

      expect(response.status).to eq(201)
    end
  end
end
