class User < ActiveRecord::Base
    has_secure_password
    def mood
        if self.nausea != nil && self.happiness != nil
            if self.nausea > self.happiness
                "sad"
            elsif self.nausea < self.happiness
                "happy"
            end
        end
    end
end
