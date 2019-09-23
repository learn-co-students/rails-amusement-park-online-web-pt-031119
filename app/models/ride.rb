class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    ticket_test = @attraction.tickets - @user.tickets
    height_test = @attraction.min_height - @user.height
    
    ticket_cost = @user.tickets - @attraction.tickets
    nausea_cost = @user.nausea + @attraction.nausea_rating
    happiness_boost = @user.happiness + @attraction.happiness_rating

    if ticket_test > 0 && height_test > 0
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif ticket_test > 0
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif height_test > 0
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @user.update(tickets: ticket_cost)
      @user.update(nausea: nausea_cost)
      @user.update(happiness: happiness_boost)
      "Thanks for riding the #{@attraction.name}!"
    end

  end
end
