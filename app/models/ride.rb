class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


def go_on_ride
  
  
  self.user.tickets = self.user.tickets - self.attraction.tickets
  self.user.happiness += self.attraction.happiness_rating
  self.user.nausea += self.attraction.nausea_rating
  self.user.save
  "Thanks for riding the #{self.attraction.name}!"
  
  
  

end



end
