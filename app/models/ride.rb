class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


def go_on_ride
    binding.pry

end
end
