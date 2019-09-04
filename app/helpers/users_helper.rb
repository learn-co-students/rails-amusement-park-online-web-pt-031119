module UsersHelper
    def admin?(user)
        "ADMIN" if user.admin
    end
end
