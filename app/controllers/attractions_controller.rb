class AttractionsController < ApplicationController
    
    def new
     
    end
    
    def create
    binding.pry
    
    redirect_to user_path current_user
    end
    
    def index
        @attractions = Attraction.all
    end
    
    
    def show
        @attraction = Attraction.find_by_id(params[:id])
    end




end
