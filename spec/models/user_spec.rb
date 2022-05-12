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
      @user1 = User.create(name: "user", email: "user@TEST.com", password: "user_password", password_confirmation: "user_password")
      @user2 = User.create(name: "user", email: "user@TEST.com", password: "user_password", password_confirmation: "user_password")

      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return nil with the wrong password' do
      @user = User.create(name: "Test", email: "TEST@TEST.com", password: "Password", password_confirmation: "Password")
      @auth_user = @user.authenticate_with_credentials("TEST@TEST.com", "Pa55word")
      expect(@auth_user).to eq(nil)
    end

    it 'should successfully authenticate with extra spaces' do
      @user = User.create(name: "Test", email: "TEST@TEST.com", password: "Password", password_confirmation: "Password")
      @auth_user = @user.authenticate_with_credentials("  TEST@TEST.com  ", "Password")
      expect(@auth_user).to_not eq(nil)
    end
  end
  
end
