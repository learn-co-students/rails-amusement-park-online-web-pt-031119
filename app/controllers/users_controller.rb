require 'pry'
class UsersController < ApplicationController
  #before_action :user_authenticate, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if User.find_by(id: params[:id]) && session[:user_id]
      @user = User.find_by(id: params[:id])
      @message = :message
      render :show
    else
      redirect_to "/"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
  end
end
