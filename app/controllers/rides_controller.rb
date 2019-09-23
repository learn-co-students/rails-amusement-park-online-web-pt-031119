class RidesController < ApplicationController

  def create
    
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @ride = Ride.new(name: @attraction.name, tickets: @attraction.tickets, nausea_rating: @attraction.nausea_rating, attraction_id: params[:ride][:attraction_id])
    @user.rides << @ride
    @ride.save
    @user.save
    @user.rides.last.take_ride
    @user.save
    redirect_to user_path(@user)
  end
  
end