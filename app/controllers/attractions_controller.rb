class AttractionsController < ApplicationController
    
    def new
     @attraction = Attraction.new
    end
    
    def create
     @attraction = Attraction.new(attraction_params)
    @attraction.save

    redirect_to attraction_path @attraction
    end
    
    def index
        @attractions = Attraction.all
    end
    def edit
       @attraction = Attraction.find_by_id(params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        end 
    end
    
    def show
        @attraction = Attraction.find_by_id(params[:id])
        @ride = Ride.new
    end

 
    def attraction_params
        params.require(:attraction).permit(:name, :ticket, :height, :nausea, :tickets, :happiness, :admin)
     end

end
