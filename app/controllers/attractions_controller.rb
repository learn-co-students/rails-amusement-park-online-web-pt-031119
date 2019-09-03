class AttractionsController < ApplicationController

	def new
	end

	def create

	end

	def index
		@attractions = Attraction.all
		@user = User.find_by(id: session[:user_id])
	end

	def show
		if session[:user_id]
			@user = User.find_by(id: session[:user_id])
	  		@attraction = Attraction.find_by(id: params[:id])
	  		@ride = Ride.new
	  	else
	  		redirect_to '/'
	  	end
	end

end