class RidesController < ApplicationController
    def create
        attraction = Attraction.find_by(id: params[:attraction_id])
        @ride = attraction.rides.build(user: current_user)
        @ride.save
        session[:message] = @ride.take_ride
        redirect_to current_user
    end
end
