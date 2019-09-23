class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  
  def mood
    @user = self
    if @user.nausea
      if @user.nausea > @user.happiness
        "sad"
      else
        "happy"
      end
    end
  end

end
