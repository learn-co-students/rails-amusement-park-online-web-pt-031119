class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides

    # def count_users
    #     user_count = Users.all.count
    # end
end
