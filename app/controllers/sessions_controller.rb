class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:users][:email])
    byebug

    if @user && @user.authenticate(params[:users][:password])
      session[:user_id] = @user.id
      redirect_to '/profile'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
