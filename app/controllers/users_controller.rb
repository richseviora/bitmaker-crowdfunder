class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # automatically log in the user to the website after he's created himself - this is method gained from sorcery
      auto_login(@user)
      # used when a user tries to access a page while logged out, is asked to login
      redirect_back_or_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name,:password, :password_confirmation)
  end
end
