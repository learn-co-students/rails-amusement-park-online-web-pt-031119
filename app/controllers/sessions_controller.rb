class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

  end

  def new
    @users = User.all
    render 'signin'
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  # def create
  #   @user = User.find_by(name: params[:user][:name])
  #   if @user && @user.authenticate(params[:user][:password])
  #     session[:user_id] = @user.id
  #     # redirect_to root_path
  #   else
  #     render 'sessions/new'
  #   end
  # end
  
end