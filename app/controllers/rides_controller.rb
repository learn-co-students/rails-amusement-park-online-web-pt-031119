class RidesController < ApplicationController

	def new
		@ride = Ride.new
	end

	def create

		@user = User.find_by(id: session[:user_id])
		@attraction = Attraction.find_by(id: params[:ride][:attraction_id])
		
		if @user && @attraction
			@ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
		    @message = @ride.take_ride
		    redirect_to user_path(@user, :message => @message)
	    else
	    	redirect_to '/signin'
	    end
	end

end