class UsersController < ApplicationController
  def new
  end

  def create
    val = User.find_by email: user_params[:email]
    @user = User.new(user_params)
    if !val && @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else 
      redirect_to '/login', notice: "invalid account"
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
end
