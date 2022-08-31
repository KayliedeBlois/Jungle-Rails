require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @correctUser = User.new
      @correctUser.name = "TestUserName"
      @correctUser.email = "test@test.com" 
      @correctUser.password = "password"
      @correctUser.password_confirmation = "password"
    end

    it "Should not produce an error when passwords are correct" do
      
      @correctUser.valid?
      error = @correctUser.errors.full_messages
      expect(error).to be_empty
    end

    it "Should produce an error if passwords don't match" do

      @correctUser.password = "password"
      @correctUser.password = "PaSsWoRd"
      @correctUser.valid?
      error = correctUser.errors.full_messages
      expect(error).to include("Passwords do not match")
    end

    it "Should produce an error if email, first name or last name fields are empty" do

      @correctUser.name = nil
      @correctUser.email = nil
      @correctUser.valid?
      error = @correctUser.errors.full_messages
      expect(error).to include("Email field cannot be empty", "Name field cannot be empty")
    end

    it "Should produce an error when the not case sensitive email is taken" do
      @testUser1 = User.create(
        name: "TestUser1",
        email: "Test1@test.com",
        password: "password1",
        password_confirmation: "password1"
      );

      @testUser2 = User.create(
        name: "TestUser2",
        email: "TEST1@test.com",
        password: "Password2",
        password_confirmation: "Password2"
      );

      @testUser2.valid?
      error = @testUser2.errors.full_messages
      expect(error).to include("Email is already in use")
    end

    it "Should produce an error when the password is less than 6 characters" do
      
      @correctUser.password = "test"
      @correctUser.password_confirmation = "test"
      @correctUser.valid?
      error = @correctUser.errors.full_messages
      expect(error).to include("Password must be a minimum of 6 characters long")
    end
  end

  describe '.authenticate_with_credentials' do

    before do
      @correctUser = User.new
      @correctUser.name = "TestUserName"
      @correctUser.email = "test@test.com" 
      @correctUser.password = "password"
      @correctUser.password_confirmation = "password"
    end

    it "Should return nil if the user does not already exist in the database" do
      user = User.authenticate_with_credentials("1", "1")
      expect(user).to eq(nil)
    end

    it "Should return a user object if the email and password provided are correct" do
      user = User.authenticate_with_credentials("test@test.com", "password")
      expect(user).not_to eq(nil)
    end

    it "Should return nill if the user exists but the password provided is not correct" do
      user = User.authenticate_with_credentials("test@test.com", "PaSsWOrd")
      expect(user).to eq(nil)
    end

    it "Should return a user object if the email is not case sensitive" do
      user = User.authenticate_with_credentials("test@test.com", "TeSt@TeST.COM")
      expect(user).not_to eq(nil)
    end

    it "Should return a user object if the user adds spaces before or after their email" do
      user = User.authenticate_with_credentials("     test@test.com", "test@test.com")
      expect(user).not_to eq(nil)
    end
  end
end
