require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @correctUser = User.new
      @correctUser.name = "TestUserName"
      @correctUser.email = "test@test.com" 
      @correctUser.password = "password"
      @correctUser.password = "password"
    end

    it "Should not produce an error when passwords are correct" do
      
      @correctUser.valid?
      error = @correctUser.errors.full_messages
      expect(error).to be_empty
    end

  end
end
