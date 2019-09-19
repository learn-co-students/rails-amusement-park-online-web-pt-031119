class SessionsController < ApplicationController
   
   skip_before_action :require_login, only: [:new, :create]


    def new
     @user = User.new

    end

    def create
      @user = User.find_by(name: params[:user][:name])
      if @user.nil?
         redirect_to new_user_path
      elsif @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
           redirect_to @user
      end
    end


    def destroy
      session.delete :user_id
      redirect_to root_url

    end


    private 
    def signin_params
       params.require(:user).permit(:name, :password)
    end
 

end

