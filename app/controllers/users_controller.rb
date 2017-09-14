class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/show'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def login
  end

  def logout
    session.clear
    redirect_to 'welcome/index'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :location)
  end

end
