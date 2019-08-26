class UsersController < ApplicationController

    def index
        @users = User.all 
    end 
   
    def new 
        #binding.pry 
        @user = User.new 
    end 

    def create 
        #raise params.inspect
        #binding.pry 
        @user = User.new(user_params)
        #@user.admin == 0 ? @user.admin = false : @user.admin = true
        # if @user.admin == 0      
        #     @user.admin = false
        # elsif @user.admin == 1
        #     @user.admin = true
        # end 
        
        return redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id 
      
        redirect_to user_path(@user) 
        end  

    def show
        if !logged_in?
            redirect_to '/'
        else
           @user = User.find(params[:id])
        end         
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
    end 

end 