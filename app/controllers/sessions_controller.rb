class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find(params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
