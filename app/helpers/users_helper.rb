module UsersHelper

    def admin?(user)
        if user.admin == true
            "ADMIN"
        end
    end


end
