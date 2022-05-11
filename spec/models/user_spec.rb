require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save when all fields are provided' do
      @user = User.create(name: "user", email: "user@TEST.com", password: "user_password", password_confirmation: "user_password")
      expect(@user).to be_valid
    end
  end
  
end
