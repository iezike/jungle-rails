require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save when all fields are provided' do
      @user = User.create(name: "user", email: "user@TEST.com", password: "user_password", password_confirmation: "user_password")
      expect(@user).to be_valid
    end

    it 'should not save if password_confirmation and password fields do not match' do
      @user = User.create(name: "user", email: "user@TEST.com", password: "user_password", password_confirmation: "user_Password")
      expect(@user).to_not be_valid
    end

    it 'should have a unique email' do
      @user1 = User.create(name: "Test", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
      @user2 = User.create(name: "Test", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")

      expect(@user2).to_not be_valid
    end
  end
  
end
