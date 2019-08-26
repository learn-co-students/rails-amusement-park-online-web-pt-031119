class RidesController < ApplicationController

    def new 
        @ride = Ride.new
    end 

    def create
        #binding.pry
        @ride = Ride.new(ride_params)
        if @ride.save
            flash[:message] = @ride.take_ride
            redirect_to user_path(current_user)
        end 
    end 
    
    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end 