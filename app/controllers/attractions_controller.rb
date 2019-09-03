class AttractionsController < ApplicationController

	def new
		@user = User.find_by(id: session[:user_id])
		if @user.admin
			@attraction = Attraction.new
		else
			redirect_to '/'
		end
	end

	def create
	    @attraction = Attraction.create(attraction_params)
	    if @attraction
	    	redirect_to attraction_path(@attraction)
	    else
	    	render :new
	    end
	end

	def index
		if session[:user_id]
			@attractions = Attraction.all
			@user = User.find_by(id: session[:user_id])
		else
	  		redirect_to '/'
	  	end
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

	def edit
		@attraction = Attraction.find_by(id: params[:id])
	end

	def update
		@attraction = Attraction.find_by(id: params[:id])r
		@attraction.update(name: attraction_params[:name], tickets: attraction_params[:tickets], nausea_rating: attraction_params[:nausea_rating], happiness_rating: attraction_params[:happiness_rating], min_height: attraction_params[:min_height])
		redirect_to attraction_path(@attraction)
	end

	private

	def attraction_params
    	params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :tickets, :min_height, :admin)
  	end

end

#This is just a test