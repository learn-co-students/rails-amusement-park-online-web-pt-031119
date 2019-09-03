class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
  	if session[:user_id]
  		@user = User.find_by(id: params[:id])
  	else
  		redirect_to '/'
  	end
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    else
    	render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  end

end