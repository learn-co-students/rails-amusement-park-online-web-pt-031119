class RidesController < ApplicationController

	def new
		@ride = Ride.new
	end

	def create
		binding.pry
		@user = User.find_by(id: session[:user_id])
	    if @user
	    	return head(:forbidden) unless @user.authenticate(user_params[:password])
	    	session[:user_id] = @user.id
	    	redirect_to user_path(@user)
	    else
	    	redirect_to '/signin'
	    end
	end

	private

	def user_params
    	params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  	end

end