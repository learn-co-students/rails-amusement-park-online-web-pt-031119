class Ride < ApplicationRecord
	belongs_to :attraction
	belongs_to :user

	def take_ride
		@ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
		if @ride.user.tickets < @ride.attraction.tickets && @ride.user.height < @ride.attraction.min_height
			"Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif @ride.user.tickets < @ride.attraction.tickets
			"Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif @ride.user.height < @ride.attraction.min_height
			"Sorry. You are not tall enough to ride the #{attraction.name}."
		else 
			@ride.user.tickets = @ride.user.tickets -= @ride.attraction.tickets
			@ride.user.nausea = @ride.user.nausea += @ride.attraction.nausea_rating
			@ride.user.happiness = @ride.user.happiness += @ride.attraction.happiness_rating
			@ride.user.save
		end
	end

end
