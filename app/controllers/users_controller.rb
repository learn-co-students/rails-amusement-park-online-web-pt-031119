class UsersController < ApplicationController

    def index
        @users = Users.all 
    end 
   
    def new 
        #binding.pry 
        @user = User.new 
    end 

    def create 
        #binding.pry 
        @user = User.create(user_params)
        redirect_to new_user_path unless @user.authenticate(params[:password])
        session[:user_id] = @user.id 
      
        redirect_to user_path(@user) 
        end  

    def show 
        @user = User.find(params[:user_id])
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height)
    end 

end 