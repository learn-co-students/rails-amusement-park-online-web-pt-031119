class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.nausea > self.happiness
            "sad"
        elsif self.happiness > self.nausea
            "happy"
        end
    end

    def admin_update
        if self.admin == 0
            self.admin = false 
        elsif self.admin == 1
            self.admin = true
        end
    end
end
