require 'rails_helper'

RSpec.describe "User", type: :model do
  context "attributes" do
    let(:user) { User.create(first_name: "Bob", last_name: "Smith", email: "Bob@smith.com", password: "testtest")}

    it "can be created" do
      expect(user).to be_valid
    end

    it "first_name is required" do
      user.first_name = nil
      expect(user.save).to be(false)
    end

    it "last_name is required" do
      user.last_name = nil
      expect(user.save).to be(false)
    end

    it "email is required" do
      user.email = nil
      expect(user.save).to be(false)
    end

    it "email must be unique" do
      user # used for user presence of the let variable
      user_2 = User.create(first_name: "Bob", last_name: "Smith", email: "Bob@smith.com", password: "testtest")

      expect(user_2).to_not be_valid
    end

    it "password_digest stores the encrypted password" do
      expect(user.password_digest).to_not eq(nil)
    end
    it "includes the authenicate method" do
      expect(user.methods).to include(:authenticate)
    end
  end
end
