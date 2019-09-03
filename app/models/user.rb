class User < ApplicationRecord
	has_many :rides
	has_many :attractions, through: :rides
	has_secure_password
	validates :password, presence: true

	def mood
		if self.nausea > self.happiness
			"sad"
		elsif self.happiness > self.nausea
			"happy"
		end
	end

end