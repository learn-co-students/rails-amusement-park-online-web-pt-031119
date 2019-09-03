class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
	end

	def show
		if session[:user_id]
	  		@attraction = Attraction.find_by(id: params[:id])
	  	else
	  		redirect_to '/'
	  	end
	end

end