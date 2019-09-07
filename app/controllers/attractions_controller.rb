class AttractionsController < ApplicationController
    
    def new
     
    end
    
    def create
   
    
    redirect_to user_path current_user
    end
    
    def index
        @attractions = Attraction.all
    end
    
    
    def show
        @attraction = Attraction.find_by_id(params[:id])
        @ride = Ride.new
    end

 
    def attraction_params
        params.require(:attraction).permit(:name, :ticket, :height, :nausea, :tickets, :happiness, :admin)
     end

end
