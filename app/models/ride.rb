class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !tall_enough? && !enough_tickets?
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !tall_enough?
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif !enough_tickets?
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
            return "Thanks for riding the #{attraction.name}!"
        end

    end

    def tall_enough?
        self.user.height > self.attraction.min_height
    end

    def enough_tickets?
        self.user.tickets > self.attraction.tickets
    end
end
